#!/usr/bin/env python
# coding: utf-8

# # Objective:
# ### Analyze recent job trends in Canada by extracting keywords from a Google BigQuery table and generating a word cloud based on the title column.

# In[104]:


import pandas as pd
import numpy as np
import pandas_gbq


# ## 1. Read data from gdq

# In[105]:


# TODO: Set project_id to your Google Cloud Platform project ID.
project_id = "weekly-market-trend"

sql = """
SELECT *
FROM `weekly-market-trend.test.news2026`
"""
df = pandas_gbq.read_gbq(sql, project_id=project_id) 


# In[106]:


df.head(10)


# #### Retrieve News Data from the Past 31 Days

# In[107]:


#conver  dtype=datetime64[ns, UTC] to datetime
from datetime import datetime
# Convert the datetime_utc column to a datetime object
df['date'] = pd.to_datetime(df['Date'], utc=True)

# Localize the datetime objects to UTC (if they are not already)
df['date'] = df['Date'].dt.tz_localize(None)

# Drop the original datetime_utc column if no longer needed
df.drop(columns=['Date'], inplace=True)
df.info()


# In[108]:


df.info()


# In[109]:


import pandas as pd
from datetime import datetime, timedelta

# Calculate the date 31 days ago from today
end_date = datetime.today()
start_date = end_date - timedelta(days=31)

# Filter the DataFrame based on the date range
df = df[(df['date'] >= start_date) & (df['date'] <= end_date)]

# Now 'filtered_df' contains only the rows with dates from the last 31 days
print(df['date'])


# ## 2. Clean data

# In[110]:


import re
def pre_process(text):
    
    # lowercase
    text=text.lower()
    
    #remove tags
    text=re.sub("","",text)
    
    # remove special characters and digits
    text=re.sub("(\\d|\\W)+"," ",text)
    
    return text

df['Title'] = df['Title'].apply(lambda x:pre_process(x))

df['Title']


# ## 3. Natural Language Processing

# ### 3.1 tokenlized words

# In[111]:


#pip install nltk


# In[112]:


import nltk
print(nltk.__version__)


# In[113]:


from nltk.tokenize import word_tokenize
nltk.download('punkt')


# In[114]:


def word_token(data):
    words=word_tokenize(data)
    return words


# In[115]:


df['tocken_title'] = df['Title'].apply(lambda x:word_token(x))


# In[116]:


df['tocken_title']


# ### 3.2 Lemmatize

# In[117]:


from nltk.stem import WordNetLemmatizer
nltk.download('wordnet')
wordnet_lemmatizer = WordNetLemmatizer()
nltk.download('omw-1.4')


# In[118]:


df['lemmatize'] = df['tocken_title'].apply(lambda x: [wordnet_lemmatizer.lemmatize(y) for y in x]) # Stem every word.
df


# ### 3.3 Remove stopwords

# In[119]:


import nltk
nltk.download('stopwords')
from nltk.corpus import stopwords


# In[120]:


stopWords=set(stopwords.words('english'))
print(stopWords)


# In[121]:


# add stopwords
new_words =  ["canada","news","ctv"]

stop_words = stopWords.union(new_words)

stop_words


# In[122]:


df['clean_stop'] = df['lemmatize'].apply(lambda x: ' '.join([item for item in x if item not in stop_words]))
df


# ### 3.4 Count words frequncy

# In[123]:


from sklearn.feature_extraction.text import CountVectorizer
import re

#get the text column 
docs=df['clean_stop'].tolist()

#represent text into a vector on the basis by counting frequency of each word
# removing terms that appear over 50% frequncy
cv=CountVectorizer(max_df=0.85,stop_words=stop_words)
word_count_vector=cv.fit_transform(docs)


# In[125]:


list(cv.vocabulary_.keys())[:20]


# In[136]:


#need extra DATA clean 
# add stopwords
new_words =  ["need",'follow','hope','example','let',"one",'piece','live','good','ok','author','six','st','bud','option','give','possibly','filter','example','say','canadian','new','ha','year']

stop_words = stop_words.union(new_words)


# In[137]:


df['clean_stop'] = df['clean_stop'].apply(lambda x: ' '.join([item for item in x.split() if item not in stop_words]))


# In[138]:


df['clean_stop']


# In[139]:


cv=CountVectorizer(max_df=0.50,stop_words=stop_words) 
word_count_vector=cv.fit_transform(docs)


# In[140]:


list(cv.vocabulary_.keys())[:20]


# In[141]:


Title_keywords = df['clean_stop']


# In[142]:


Title_keywords=Title_keywords.to_frame()


# In[143]:


Title_keywords


# ## 4. Upload new datafram

# In[144]:


import pandas as pd
import pandas_gbq


# In[145]:


project_id = "weekly-market-trend"

table_id = 'weekly-market-trend.test.Title_keywords'


pandas_gbq.to_gbq(Title_keywords, table_id, project_id=project_id,if_exists='replace')


# ## 5. Sentiment analysis
# 

# In[146]:


from vaderSentiment.vaderSentiment import SentimentIntensityAnalyzer
analyzer = SentimentIntensityAnalyzer()


# In[147]:


#reference：https://www.datacamp.com/tutorial/text-analytics-beginners-nltk
# initialize NLTK sentiment analyzer

analyzer = SentimentIntensityAnalyzer()


# create get_sentiment function

def get_sentiment(text):

    scores = analyzer.polarity_scores(text)

    sentiment = 1 if scores['pos'] > 0 else 0

    return sentiment




# apply get_sentiment function

df['sentiment(positive)'] = df['Description'].apply(get_sentiment)

df


# In[148]:


pos_percentage=((df['sentiment(positive)'].sum())/(df['sentiment(positive)'].count()))*100


# In[149]:


pos_percentage=(df['sentiment(positive)'].sum())/(df['sentiment(positive)'].count())
print("Positive News Coverage Accounts for {}%".format((pos_percentage*100).round(2)))


# In[150]:


# Create a DataFrame with a single column "pos_News" and a value for positive news percentage
sentimentdata = {'pos_News': [pos_percentage.round(4)]}

df_sentiment = pd.DataFrame(sentimentdata)

# Print the DataFrame
print(df_sentiment)


# In[151]:


project_id = "weekly-market-trend"

table_id = 'weekly-market-trend.test.pos_percentage'


pandas_gbq.to_gbq(df_sentiment, table_id, project_id=project_id,if_exists='replace')


# In[ ]:





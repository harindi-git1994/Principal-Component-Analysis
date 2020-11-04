#!/usr/bin/env python
# coding: utf-8

# # PCA (Principal Components Analysis)
# ## wine.cvs

# In[16]:


#importing necessary libraries
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import sklearn.decomposition as sk
from sklearn.decomposition import PCA
from sklearn.preprocessing import scale  


# In[17]:


#imporing the dataset
wine = pd.read_csv("C:\\Users\\yhari\\OneDrive\\Documents\\1. Data Analyst Training\\CSV files\\wine.csv")


# In[18]:


#describe the dataset
wine.describe()


# In[19]:


#view top 5 records
wine.head()


# In[20]:


#Consider only the numerical data
wine.data = wine.iloc[:,1:]


# In[21]:


wine.data.head()


# In[22]:


#Standardizing;Normalizing the numerical data
wine_norm = scale(wine.data)


# In[23]:


#look for the type of data, array or dataframe
type(wine_norm)


# In[24]:


#convert ndarray into a dataframe
wine1 = pd.DataFrame(wine_norm)


# In[25]:


wine1.head(3)


# In[26]:


#creating PCA models
x = PCA()
m1 = PCA().fit_transform(wine1)
m2 = x.fit_transform(wine_norm)


# In[27]:


#shape of the PCA model
m1


# In[28]:


#The amount of varience that each PCA explain is
var = x.explained_variance_ratio_
var


# In[29]:


#components of PCA
x.components_


# In[30]:


#conver the ndarray to a dataframe
wts = pd.DataFrame(x.components_)
wts


# In[31]:


#cumilative varience
cumvar = np.cumsum(np.round(var, decimals = 4)*100)
cumvar


# In[32]:


newdata = pd.DataFrame(cumvar)


# In[33]:


newdata.head()


# In[34]:


#convert the m1 model's ndarray to a dataframe and assign 
#to a new variable call new_wine 

new_wine = pd.DataFrame(m1)
new_wine


# In[35]:


#variance plot for PCA components obtained 
plt.plot(cumvar, color='red')
plt.show()


# In[ ]:





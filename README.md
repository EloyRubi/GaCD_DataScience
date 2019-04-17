{\rtf1\ansi\ansicpg1252\cocoartf1561\cocoasubrtf600
{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
{\*\expandedcolortbl;;}
\paperw11900\paperh16840\margl1440\margr1440\vieww14360\viewh12940\viewkind0
\pard\tx566\tx1133\tx1700\tx2267\tx2834\tx3401\tx3968\tx4535\tx5102\tx5669\tx6236\tx6803\pardirnatural\partightenfactor0

\f0\fs24 \cf0 \
#Getting and Cleaning Data - Coursera Data Science\
\
## Course Project\
\
This is the course project for the Getting and Cleaning Data course. The run_analysis.R does the following.\
\
1. Downloads the dataset and unzips it.\
2. Loads the train and test datasets into R, keeping the columns with a mean or a std measure\
3. Loads activity and subject datasets\
4. Merges the datasets\
5. Produces a tidy dataset of the mean value of each variable, previously reshaped through the _melt_ and _dcast_ functions.\
\
The result is shown in *tidyData.txt*}
# Crowdfunding_ETL
This project aims to build an ETL pipeline using Python, Pandas, and Python dictionary methods or regular expressions to extract and transform data. Transformed data was used to create four CSV files, an ERD, and a table schema. Successfully uploaded CSV file data into a Postgres databases.

## Tools Used
- Python
- Pandas
- Numpy
- Postgres Database




![Crowdfunding_ERD](https://user-images.githubusercontent.com/24644072/222935895-e7c10e83-f0b0-421c-a247-35bcfd0565f8.png)



Extract the crowdfunding.xlsx Data
# Read the data into a Pandas DataFrame
crowdfunding_info_df = pd.read_excel('Resources/crowdfunding.xlsx')
crowdfunding_info_df.head()
cf_id	contact_id	company_name	blurb	goal	pledged	outcome	backers_count	country	currency	launched_at	deadline	staff_pick	spotlight	category & sub-category
0	147	4661	Baldwin, Riley and Jackson	Pre-emptive tertiary standardization	100	0	failed	0	CA	CAD	1581573600	1614578400	False	False	food/food trucks
1	1621	3765	Odom Inc	Managed bottom-line architecture	1400	14560	successful	158	US	USD	1611554400	1621918800	False	True	music/rock
2	1812	4187	Melton, Robinson and Fritz	Function-based leadingedge pricing structure	108400	142523	successful	1425	AU	AUD	1608184800	1640844000	False	False	technology/web
3	2156	4941	Mcdonald, Gonzalez and Ross	Vision-oriented fresh-thinking conglomeration	4200	2477	failed	24	US	USD	1634792400	1642399200	False	False	music/rock
4	1365	2199	Larson-Little	Proactive foreground core	7600	5265	failed	53	US	USD	1608530400	1629694800	False	False	theater/p


Create the Category and Subcategory DataFrames
Create a Category DataFrame that has the following columns:

A "category_id" column that is numbered sequential form 1 to the length of the number of unique categories.
A "category" column that has only the categories.
Export the DataFrame as a category.csv CSV file.

Create a SubCategory DataFrame that has the following columns:

A "subcategory_id" column that is numbered sequential form 1 to the length of the number of unique subcategories.
A "subcategory" column that has only the subcategories.
Export the DataFrame as a subcategory.csv CSV file.

# Get the crowdfunding_info_df columns.
crowdfunding_info_df.columns
Index(['cf_id', 'contact_id', 'company_name', 'blurb', 'goal', 'pledged',
       'outcome', 'backers_count', 'country', 'currency', 'launched_at',
       'deadline', 'staff_pick', 'spotlight', 'category & sub-category'],
      dtype='object')
# Assign the category and subcategory values to category and subcategory columns.
crowdfunding_info_df[['category','subcategory']] = crowdfunding_info_df['category & sub-category'].str.extract('(.+)/(.+)',expand=True)
crowdfunding_info_df.head()
cf_id	contact_id	company_name	blurb	goal	pledged	outcome	backers_count	country	currency	launched_at	deadline	staff_pick	spotlight	category & sub-category	category	subcategory
0	147	4661	Baldwin, Riley and Jackson	Pre-emptive tertiary standardization	100	0	failed	0	CA	CAD	1581573600	1614578400	False	False	food/food trucks	food	food trucks
1	1621	3765	Odom Inc	Managed bottom-line architecture	1400	14560	successful	158	US	USD	1611554400	1621918800	False	True	music/rock	music	rock
2	1812	4187	Melton, Robinson and Fritz	Function-based leadingedge pricing structure	108400	142523	successful	1425	AU	AUD	1608184800	1640844000	False	False	technology/web	technology	web
3	2156	4941	Mcdonald, Gonzalez and Ross	Vision-oriented fresh-thinking conglomeration	4200	2477	failed	24	US	USD	1634792400	1642399200	False	False	music/rock	music	rock
4	1365	2199	Larson-Little	Proactive foreground core	7600	5265	failed	53	US	USD	1608530400	1629694800	False	False	theater/plays	theater	plays
# Get the unique categories and subcategories in separate lists.
categories = crowdfunding_info_df['category'].unique()
subcategories = crowdfunding_info_df['subcategory'].unique()
print(categories)
print(subcategories)
['food' 'music' 'technology' 'theater' 'film & video' 'publishing' 'games'
 'photography' 'journalism']
['food trucks' 'rock' 'web' 'plays' 'documentary' 'electric music' 'drama'
 'indie rock' 'wearables' 'nonfiction' 'animation' 'video games' 'shorts'
 'fiction' 'photography books' 'radio & podcasts' 'metal' 'jazz'
 'translations' 'television' 'mobile games' 'world music'
 'science fiction' 'audio']
# Get the number of distinct values in the categories and subcategories lists.
print(len(categories))
print(len(subcategories))
9
24
# Create numpy arrays from 1-9 for the categories and 1-24 for the subcategories.
category_ids = np.arange(1, 10)
subcategory_ids = np.arange(1, 25)

print(category_ids)
print(subcategory_ids)
[1 2 3 4 5 6 7 8 9]
[ 1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24]
# Use a list comprehension to add "cat" to each category_id. 
cat_ids =  [str(id).replace("","cat",1) for id in category_ids]
# Use a list comprehension to add "subcat" to each subcategory_id.    
scat_ids = [str(id).replace("",'subcat',1) for id in subcategory_ids]
    
print(cat_ids)
print(scat_ids)
['cat1', 'cat2', 'cat3', 'cat4', 'cat5', 'cat6', 'cat7', 'cat8', 'cat9']
['subcat1', 'subcat2', 'subcat3', 'subcat4', 'subcat5', 'subcat6', 'subcat7', 'subcat8', 'subcat9', 'subcat10', 'subcat11', 'subcat12', 'subcat13', 'subcat14', 'subcat15', 'subcat16', 'subcat17', 'subcat18', 'subcat19', 'subcat20', 'subcat21', 'subcat22', 'subcat23', 'subcat24']
# Create a category DataFrame with the category_id array as the category_id and categories list as the category name.
category_df = pd.DataFrame(list(zip(cat_ids,category)),columns=['cat_ids','category'])
# Create a category DataFrame with the subcategory_id array as the subcategory_id and subcategories list as the subcategory name. 
subcategory_df = pd.DataFrame(list(zip(scat_ids,subcategories)),columns = ['scat_ids','subcategory'])
category_df
cat_ids	category
0	cat1	food
1	cat2	music
2	cat3	technology
3	cat4	theater
4	cat5	film & video
5	cat6	publishing
6	cat7	games
7	cat8	photography
8	cat9	journalism
subcategory_df

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

# Get the unique categories and subcategories in separate lists.
categories = crowdfunding_info_df['category'].unique()
subcategories = crowdfunding_info_df['subcategory'].unique()
print(categories)
print(subcategories)

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




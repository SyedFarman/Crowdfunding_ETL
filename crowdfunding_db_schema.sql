-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/Jtkodh
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Modify this code to update the DB schema diagram.
-- To reset the sample schema, replace everything with
-- two dots ('..' - without quotes).

CREATE TABLE "campaign" (
    "cf_id" int   NOT NULL,
    "contact_id" int   NOT NULL,
    "company_name" varchar   NOT NULL,
    "description" varchar   NOT NULL,
    "goal" float   NOT NULL,
    "pledged" float   NOT NULL,
    "outcome" varchar   NOT NULL,
    "backers_count" int   NOT NULL,
    "country" varchar   NOT NULL,
    "currency" varchar   NOT NULL,
    "launch_date" date   NOT NULL,
    "end_date" date   NOT NULL,
    "cat_ids" varchar   NOT NULL,
    "scat_ids" varchar   NOT NULL,
    CONSTRAINT "pk_campaign" PRIMARY KEY (
        "cf_id"
     )
);

CREATE TABLE "category" (
    "cat_ids" varchar   NOT NULL,
    "category" varchar   NOT NULL,
    CONSTRAINT "pk_category" PRIMARY KEY (
        "cat_ids"
     )
);

CREATE TABLE "subcategory" (
    "scat_ids" varchar   NOT NULL,
    "subcategory" varchar   NOT NULL,
    CONSTRAINT "pk_subcategory" PRIMARY KEY (
        "scat_ids"
     )
);

CREATE TABLE "contacts" (
    "contact_id" int   NOT NULL,
    "first_name" varchar   NOT NULL,
    "last_name" varchar   NOT NULL,
    "email" varchar   NOT NULL,
    CONSTRAINT "pk_contacts" PRIMARY KEY (
        "contact_id"
     )
);

ALTER TABLE "category" ADD CONSTRAINT "fk_category_cat_ids" FOREIGN KEY("cat_ids")
REFERENCES "campaign" ("cat_ids");

ALTER TABLE "subcategory" ADD CONSTRAINT "fk_subcategory_scat_ids" FOREIGN KEY("scat_ids")
REFERENCES "campaign" ("scat_ids");

ALTER TABLE "contacts" ADD CONSTRAINT "fk_contacts_contact_id" FOREIGN KEY("contact_id")
REFERENCES "campaign" ("contact_id");


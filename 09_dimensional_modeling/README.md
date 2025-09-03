# Dimensional Modeling
We will use dimensional modeling with star schema to structure transformed data in the data warehouse. In addition, we will build a data mart layer to serve downstream data consumers. In our case, this data mart layer is actually a separate schema in the same database where staging and warehouse schemas are located. Downstream data consumers can only access to this data mart schema. 

There are alternative data models to structure data from raw data, such as One Big Table (OBT), Third Normal Form (3NF) Normalization etc. Among those alternatives, dimensional modeling with star schema is particularly good for presenting a mental model for the business logic. Business stakeholders and data engineers work together to decide the most suitable data model. They may consider also the level of data redundancy and query performance with different data models. Then, data engineers can use the data model as the blueprint for data transformation. 


## Theory 
In the two videos below, we will go through the theory of dimensional modeling and data mart layer.

Video on dimensional modeling theory :point_down:

[![dimensional modeling](https://github.com/kokchun/assets/blob/main/data_warehouse/dimensional_modeling_video.png?raw=true)](https://youtu.be/C7ysqi_tZio)

Video on the data marts layer for serving data :point_down:

[![data marts layer](https://github.com/kokchun/assets/blob/main/data_warehouse/mart_layer_video.png?raw=true)](https://youtu.be/XmNUuzY9OHQ)

>[!Note]
Data mart layer vs OLAP cube for serving downstream data consumers: <br>
>- data mart layer is a logical construct that refers to a subset of the transformed data dedicated for a specific business team. One can choose to use a schema or a database as a data mart layer
>- OLAP cube is also a subset of the transformed data dedicated for a specific business team. But it's often referred to a specific object that can be created using a specific tool, for example, Visual Studio. OLAP cube structures data into measure and dimensions, and allows a standard set of operations, such as slice and dice, drill up and down etc. 

## Create Database Relationship Diagram
The videos below show how to practically create the offical documentation of a data model.

Video on dimensional modeling and building a star schema in dbdiagram :point_down:

[![star schema healthcare example](https://github.com/kokchun/assets/blob/main/data_warehouse/dimensional_model_hospital_video.png?raw=true)](https://youtu.be/xJFyZCtdXaQ)

Video on dimensional modeling for the job ads :point_down:

>[!Note]
>In the following lectures, in the fct_job_ads table, we will be using the following names for foreign keys:
>- occupation_id
>- employer_id
>- job_details_id
>- auxiliary_attributes_id <BR>
>
>Also, we will omit job_id but job_id is not needed in downstream data transformation. 

[![dimensional model of job ads](https://github.com/kokchun/assets/blob/main/data_warehouse/jobtech_dimensional_model.png?raw=true)](https://youtu.be/E88-G-uDxnQ)


Start by setting up a [free account in dbdiagram](https://dbdiagram.io/home). We will use dbdiagram to do data modeling and more specifically dimensional modeling. 

If you want to work with the diagrams offline in vscode download these extensions
- dbml renderer vscode extension to view data model in vscode
- vscode-dbml extension to get syntax highlighting in dbml


## Other videos :video_camera:
- [Data modeling in the modern data stack - Kahan Data Solutions (2023)](https://www.youtube.com/watch?v=IdCmMkQLvGA&list=PLy4OcwImJzBLWhUqduwLs30YHiDpX4Xp7&index=1)
- [Data modeling tutorial: star schema (aka Kimball approach) - Kahan data solutions (2023)](https://www.youtube.com/watch?v=gRE3E7VUzRU&t=6s)
- [Comparing 3 types of data modeling (normalized vs star schema vs data Vault) - Kahan data solutions (2023)](https://www.youtube.com/watch?v=qXXNhLv986I&)

## Read more :eyeglasses:
- [Dimensional modeling - wikipedia](https://en.wikipedia.org/wiki/Dimensional_modeling)
- [Kimball dimensional technique - Kimball group](https://www.kimballgroup.com/wp-content/uploads/2013/08/2013.09-Kimball-Dimensional-Modeling-Techniques11.pdf)
- [Dimensional modeling technique - Kimball group](https://www.kimballgroup.com/data-warehouse-business-intelligence-resources/kimball-techniques/dimensional-modeling-techniques/)

Very comprehensive book, but covers in depth about data warehouse and dimensional modeling. It is regarded as one of the most influential texts in the field of data warehousing.

- [Data warehouse toolkit 3rd edition - R. Kimball, M. Ross (2013) ](https://www.amazon.com/gp/product/1118530802?ie=UTF8&tag=decworks-20&lin%20kCode=xm2&camp=1789&creativeASIN=1118530802)
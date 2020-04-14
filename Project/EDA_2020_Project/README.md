# EDA_2020_Project
Final Project for Environmental Data Analytics Course Spring 2020

## Summary

This repository was prepared for the Environmental Data Analytics (Env 872L) at Duke Univeristy, Spring 2020 final project. 

The repository contains data from US Geological Survey (USGS) and North Carolina Department of Environmental Resources. Data is from the Ellerbe Creek Watershed HUC 03020201. The purpose of it is to anaylze water quality trends along Ellerbe Creek. Specifically, analysis will focus on water quality following storm events as well as seasonal and annual trends from 1968 - 2018. 

## Investigators

Rachel Landman 
Student
Duke University 
Nicholas School of the Environment
rachel.landman@duke.edu 

## Keywords

* Ellerbe Creek  
* Nutrients
* Storm Events
* Flooding
* Stream
* Creek
* Watershed 
* Water Quality 
* USGS
* NCDENR


## Database Information

Data were downloaded through the Water Quality Portal, a coorperative service sponsered by the United States Geological Survey (USGS), the Environmental Protection Agency (EPA), and the National Water Quality Monitoring Council (NWQMC). Data was accessed on February 27, 2020. 

**Water Quality Measurment Data**

From the Water Quality Portal (https://www.waterqualitydata.us/portal/), the following selections were made: 

* Location 

  - State: North Carolina
    
* Site Parameters 

  - HUC: 030202010403 (Ellerbe Creek 12 Digit HUC)
    
* Sampling Parameters

  - Sampling Media: Water
  
  - Characteristic Group: Physical
    
* Select Data Download 
  
  - Sample results (physical/chemical metadata)

* File format 
  
  - Comma-separated 

csv file was saved as `Ellerbe_WaterQuality_Raw_Data.csv`. 

**Ellerbe Spatial Data**

From the Water Quality Portal (https://www.waterqualitydata.us/portal/), the following selections were made: 

* Location 

  - State: North Carolina
    
* Site Parameters 

  - HUC: 030202010403 (Ellerbe Creek 12 Digit HUC)
    
* Sampling Parameters

  - Sampling Media: Water
  
  - Characteristic Group: Physical
    
* Select Data Download 
 
  - Site data only

* File format 
  
  - Comma-separated 

csv file was saved as Ellerbe_12DigitHUC_Stream_Stations

For more information on the Water Quality Portal visit https://www.waterqualitydata.us/portal_userguide/

## Folder structure, file formats, and naming conventions 

The repository contains the following folders:

* Code - rmd files with code for each step of the process including Data Wrangling, Data Exploration, Data Analysis, Notes, and the final project script. Additionally, knitted PDF documents will be saved in this folder. 
* Data - containing two folders, one for all raw datasets and one for all processed datasets 
* Output - Folder for outputs from visualizations (pdfs)

All scripts are saved as .rmd documents 
All scripts will be knitted and saved as a PDF when they are finished 
Both processed and raw data are stored as csv files 
Geospatial data are stored as .shp, .dbf, and .shx files 
Outputs are stored as PDF files 

Files are named according to the following convention: 
datalocation_datatype_details_stage.format

**datalocation** refers to Ellerbe Creek

**datatype** is a description of data 

**details** are additional descriptive details, particularly important for processed data 

**stage** refers to the stage in data management pipelines (e.g., raw, cleaned, or processed)

**format** is a non-proprietary file format (e.g., .csv, .txt)

## Metadata

**Ellerbe Nutrient Data** 

Column Name | Description | Class
-----------------|----------------------------------|-----------------
OrganizationIdentifier | Provides source for data, includes USGS and NC DENR | Character
ActivityStartDate | Start date for sample collection | Date
ActivityStartTime/Time | Start time for sample collection (ET) | Difftime
ActivityEndDate | End date for sample collection | Date
ActivityEndTime/Time | End time for sample collection (ET) | Difftime
MonitoringLocationIdentifier | Identification code for monitoring location, used to spatially map data along Ellerbe Creek | Character 
HydrologicEvent | Hydrologic event that led to sampling, including routine sample, storm, or flood | Character 
HydrologicCondition | Hydrologic conditions at time of sampling, including peak stage, falling stage, stable, Rising stage | Character 
CharacteristicName | Characteristic measured including, Total Nitrogen and Phosphorus, Gage height, Temperature, TDS, TSS, and Flow. When data is wide, it will be spread using this column to create new columns for each characteristic | Character 
ResultSampleFractionText | Specifies type of measurement, e.g. total phospohorus or dissolved phosphorus | Character 
ResultMeasureValue | Number value for each characteristic measured. Units vary and can be found in Ellerbe_WaterQuality_Raw_Data.csv in the raw data folder | Character
ResultStatusIdentifier | Specifies whether measurements is Accepted, Historical, or Preliminary | Character 
ResultValueTypeName | Specifies is the measurment value is actual or estimated | Character

**Ellerbe Sampling Locations **

Dataset used for mapping sampling locations along Ellerbe Creek

Column Name | Description | Class
-----------------|----------------------------------|-----------------
OrganizationIdentifier | Provides source for data, includes USGS and NC DENR | Character
MonitoringLocationIdentifier | Identification code for each location | Character
MonitoringLocationName | Common name for monitoring location | Character
HUCEightDigitCode | 8 Digit hydrologic unit code for Ellerbe Creek | Character
LatitudeMeasure | Latitude coordinate of sampling location | Character
LongitudeMeasure | Longitude coordinate of sampling location | Character

## Scripts and code

* Landman_ENV872_Project.Rmd - Final project script that will be knit into final project report PDF 
* Project_DataAnalysis.Rmd - Script for all statistical analysis of data, graphing, and visualizations 
* Project_DataExploration.Rmd - Script for exploring data through visualization and summarization 
* Project_DataWrangling.Rmd - Script for importing raw dataset and processsing data to create clean datasets for analysis 
* ProjectNotes.Rmd - Notes and code that does not fit in other scripts but might be useful later 

## Quality assurance/quality control

* Check to ensure all values are within expected range 
* Evaluate NC DENR and USGS data so ensure they are comparable
* Determine outliers through boxplots 
* Specify in results if outliers were removed
* Mapping monitoring sites to ensure correct locations along Ellerbe Creek 


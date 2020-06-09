# HFFiles.ini file Generator

## Introduction

>```Automation of the task of creating an HFFiles.ini file that contains the names of all the modified or newly added files in a build.```
HFFiles.ini is a file in which the paths of the modified or newly added files is written in a specific manner. 
This HFFiles.ini assists in the creation of FixPack.

>The task was initially done manually by identifying the modified files and writing them into the HFFiles.ini file accordingly. 
This project aims at doing it automatically in order to save time and workforce.

### What is HFFiles.ini file?

>```HFFiles.ini file```, written in a specific format is used to describe the changes made in a product. The format consists of the path of the file in the product saved on local machine (in which all the changes is made), the path of the file in the product saved on server and the name of the file. 
 
>The information regarding the changes made to the product is extracted from the HFFiles.ini file and is used to create Fix Packs, (which consists of the modified files and newly created files) and also used to update the product present in the server.

### Using SHA-256 Checksum Algorithm for Comparison

>To automate the process of generating the HFFiles.ini file, changes made to the product present in the local machine need to be identified with respect to the product present on the server. This could be done by comparing both the products. 

>To reduce the comparison time between the products, the process of comparing data files present in the products, calculating their checksum values and using them for comparison was chosen. 

>In this project, the SHA-256 checksum values are compared between the requisite file pairs and its truth value is used to determine whether the file has been modified or not. The Comparison of checksum values takes significantly lesser time than comparing the entire content of the file. 
 
>Given the large size of SHA-256 checksums, the chances of Hash Collision decreases. Due to this reason, in this project we used SHA-256 algorithm for computing checksums and then comparing them to identify files which can be included in our HFFiles.ini file. 

### Jar File Comparison

>While comparing the files present inside the product, a problem related to jar file comparison was encountered. It was seen that despite having the same content jar files were always identified as modified. The reason being the difference in the metadata of the jar file, which includes timestamp etc. which is added to the jar file at the time of its creation. Therefore, even when no changes have been made to the content of the jar files, while building the product, when the jar file is created again, it is created with a different set of metadata. 
 
>To overcome, the above problem, we came up with the idea of extracting the jar files, and computing checksums of all the files inside it and then comparing the individual file’s checksums for comparing the jar files. If any change is found in the content of the jar file, then the jar file is identified as modified. 

### Steps Involed

- To Compare the two builds, Checksum needs to be calculated.
- Checksum for the old version is calculated initially and stored in a csv file for reference.
- There are functions computing checksums for the files present inside the folder paths specified for monitoring.
- Two csv files are created.
  - After filtering out from the reference csv file, entries of the files present inside the folders being monitored (base.csv). 
  - After calculating the checksum of the files present inside the folders being monitored (target.csv).
- These two csv files are compared.
- The compare function compares the checksums for the same file in both the csv files
  - If the checksum differs, it is identified as a modified file.
  - If the file entry does not exist then it is identified as a newly added file.
- All the identified file path is then added to the text file, (report.txt) that keeps track of all the modified files. 
- After the report is created, there are functions for HFFiles.ini file creation.

```Block Diagram```

![Block Diagram](https://github.ibm.com/Order-Management-Fulfillment/HFFiles-Gen/blob/modularization/Report/block%20diagram.png)

### Class Description

| Class Name | Description |
|------------|-------------|
|`Hffile`| This class contains the main function for creating the HFFiles.ini file.|
|`Extract`| This class extracts the contents of filename.jar files inside filename.jar1 folder.|
|`Calculate`| This class computes checksums of the files and creates two csv files i.e. base.csv and target.csv (contents of these files is described above.| 
|`Difference`| This class compares the two files and identifies files which has been modified or newly added and writes the paths of the identified files into report.txt file.|
|`Functions`| This class contains common functions which are used by other classes to perform certain operations.| 
|`Extra`| This class identifies additional entries in both(automatically generated and manually created) HFFiles.ini files.|
|`Base_Checksum`| This class is used to create Reference csv file. The Reference csv file contains file paths and their checksums for all the files.|

### Reference HFFiles.ini File

A Reference HFFiles.ini File is created, which created HFFiles.ini file entries for all the files. This is done by passing an empty Reference csv file through our HFFiles.ini File Generator.

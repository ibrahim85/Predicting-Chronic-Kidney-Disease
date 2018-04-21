Data Wrangling Summary
================
Roberta Munive
April 19, 2018

The original dataset was in .arff format. It was converted to .csv format for ease of use. Analysis will be done using the .csv file format.

Exploration of the Data
-----------------------

The dataset contains 400 observations with 26 variables. This was as expected. The first column (*X*) numbers the patients from 1 to 400. The remaining 25 columns are patient attributes. The dataset is tidy.

Dataset Challenges and Limitations
----------------------------------

There are two main issues with the dataset that will need to be addressed. The first issue is the lack of documentation with the dataset. The second is the number of missing values.

Research was required to determine what each variable represented. One challenge in analyzing the data will be the fact that the variables are not truly independent. Correlation between the attributes will need to be explored. A full understanding of what each variable represents is necessary in order to determine if one variable is independent of another variable. Research was also required to determine the minimum, maximum, normal, and abnormal ranges of certain clinical observations and laboratory tests. The range of values will be important when looking at correlations between the variables and chronic kidney disease.

Explanation of Variables
------------------------

It is unclear from the dataset whether blood pressure (*bp*) represents a systolic or diastolic reading. The minimum blood pressure reading is 50 mm/Hg and the maximum is 180 mm/Hg. After consulting a [blood pressure chart](https://www.mayoclinic.org/diseases-conditions/high-blood-pressure/in-depth/blood-pressure/art-20050982) it is surmised that the numbers represent diastolic readings. This is a blood pressure reading at a single point in time. However, the hypertension variable (*htn*) will indicate whether the patient has been diagnosed with hypertension. A value of *htn* = yes would indicate abnormally high blood pressure readings without treatment. There should be a correlation between *bp* and *htn*. Because *htn* will be the primary indicator of hypertension, the analysis will not delve further into typical ranges for *bp*.

Specific gravity (*sg*) values in the dataset are (1.005, 1.010, 1.015, 1.020, 1.025). Specific gravity measures the amount of solutes dissolved in urine as compared with water (1.000). The larger numbers represent higher concentrations of dissolved solutes. Specific gravity between 1.002 and 1.035 is normal IF kidney function is normal. Health problems are associated with levels &lt; 1.005 and &gt; 1.035. According to one [source](https://www.pocd.com.au/core/media/media.nl/id.121258/c.3923593/.f?h=6f19962953ef97a31b1d), specific gravity for a patient with end stage renal disease tends toward 1.010. This statement can be investigated within the current dataset. More information regarding the specific gravity of urine can be found [here](https://www.pocd.com.au/core/media/media.nl/id.121258/c.3923593/.f?h=6f19962953ef97a31b1d).

The unique values for albumin (*al*) in the dataset are (0, 1, 2, 3, 4, 5). It is unclear what these values represent, so further investigation was necessary. The presence of albumin can be detected by a dipstick urinalysis. The reagent reacts with the albumin to give an indication of the levels excreted into the urine. These levels are categorized into groupings referred to as negative, trace, 1+, 2+, 3+ and 4+ where negative indicates the lowest concentration of albumin and 4+ indicates the highest concentration of albumin.The higher the concentration of albumin, the more likely the kidneys are not functioning properly. There should be a strong correlation between high albumin readings and chronic kidney disease. Further explanation of albumin levels can be found [here](https://www.merckmanuals.com/professional/genitourinary-disorders/approach-to-the-genitourinary-patient/evaluation-of-the-renal-patient#1152664). For the purposes of this analysis, (0, 1, 2, 3, 4, 5) will correspond to (negative, trace, 1+, 2+, 3+, 4+) respectively.

A similar situation occurs for sugar (*su*). The unique values in the dataset are (0, 1, 2, 3, 4, 5). A dipstick urinalysis can detect the presence of sugar. Ordinarily, the urine contains no sugar. The presence of sugar is categorized into groupings of 1+, 2+, 3+, and 4+ where 1+ indicates lower concentrations and 4+ indicates higher concentrations. Further explanation of the sugar levels can be found [here](https://www.bloodtestsresults.com/urine-sugar-levels-chart-what-does-sugar-in-urine-mean/). This analysis will assume that (0, 1, 2, 3, 4, 5) represents a scale from no sugar (0) to progressively higher concentrations of sugar in the urine. There may be a correlation between urine sugar levels (*su*) and diabetes (*dm*), depending upon whether the diabetes is under control. The diabetes mellitus variable (*dm*) will indicate whether the patient has been diagnosed with diabetes. A value of *dm* = yes would indicate abnormally high glucose readings without treatment. Because *dm* will be the primary indicator of diabetes, the analysis will not delve further into typical ranges for *su*.

The following variables are part of a urinalysis which can screen for abnormal substances in the urine:
*Red blood cells (rbc) *Pus cells (pc) *Pus cell clumps (pcc) *Bacteria (ba) Abnormal substances in the urine may be due to the fact that the kidneys are not functioning properly. Thus, abnormal values for these variables may have a correlation with chronic kidney disease. More information about urinalysis may be found [here](https://labtestsonline.org/tests/urinalysis).

Blood glucose random (*bgr*) values in the dataset range from a minimum of 22 mgs/dl to a maximum of 490 mg/dL. A random blood glucose test measures the amount of glucose in the blood without fasting, so it can vary based upon when the patient last ate. However, normal values are typically less than 125 mg/dL. A result of 200 mg/dL or higher is often indicative of diabetes. *bgr* is a glucose reading at a single point in time. However, the diabetes mellitus variable (*dm*) will indicate whether the patient has been diagnosed with diabetes. That is, *dm* = yes would indicate abnormally glucose readings without treatment. There should be a correlation between *bgr* and *dm*. Because *dm* will be the primary indicator of diabetes, the analysis will not delve further into typical ranges for *bgr*. More information on testing blood sugar levels can be found [here](https://medlineplus.gov/ency/article/003482.htm).

Blood urea (*bu*) values in the dataset range from a minimum of 1.5 mg/dL to a maximum of 391 mg/dL. A blood urea test measures the amount of urea in the blood. A higher than normal level of urea in the blood suggests that the kidneys may not be filtering waste properly. That is, the kidneys are not functioning as they should. In general, results of approximately 7 mg/dL to 20 mg/dL are considered normal. There should be a correlation between high *bu* values and chronic kidney disease. More information on blood urea testing can be found [here](https://www.mayoclinic.org/tests-procedures/blood-urea-nitrogen/about/pac-20384821).

Serum creatinine (*sc*) values in the dataset range from a minimum of 0.4 mg/dL to to a maximum of 76 mg/dL. A serum creatinine test measures the amount of creatinine in the blood. A higher than normal level of creatinine in the blood suggests that the kidneys may not be filtering waste properly. That is, the kidneys are not functioning as they should. In general, results of approximately 0.84 mg/dL to 1.21 mg/dL are considered normal. There should be a correlation between high *sc* values and chronic kidney disease. More information on serum creatinine testing can be found [here](https://www.mayoclinic.org/tests-procedures/creatinine-test/about/pac-20384646).

Serum electrolytes, such as sodium and potassium, may become abnormal with chronic kidney disease. When the kidneys malfunction, either high or low levels of electrolytes may be seen. The normal range for blood sodium levels is typically between 135 mEq/L to 145 mEq/L. Sodium (*sod*) values in the dataset range from a minimum of 4.5 mEq/L to a maximum of 163 mEq/L. The normal range for serum potassium is between 3.5 mEq/L to 5.5 mEq/L. The potassium (*pot*) values in the dataset range from a minimum of 2.5 mEq/L to a maximum of 47 mEq/L.

A white blood cell count measures the number of white blood cells in the blood. This test can help determine if there is infection or inflammation within the body. White blood cell count (*wbcc*) values in the dataset range from a minimum of 2200 cells/cmm to a maximum of 26400 cells/cmm. Normal ranges are generally between 4300 cells/cmm and 10800 cells/cmm.

Packed cell volume indicates the proportion of red blood cells (RBCs) in the blood. Normally, RBCs comprise 37% to 49% of blood volume. Packed cell volume (*pcv*) values in the dataset range from a minimum of 9% to a maximum of 54%. With chronic kidney disease, the production of RBCs decreases, leading to anemia. The anemia variable (*ane*) will indicate whether the patient has been diagnosed with anemia. That is, *ane* = yes will indicate a diagnosis of anemia. There should be a correlation between low *pcv*, *ane*, and chronic kidney disease. More information on packed cell volume can be found [here](https://labtestsonline.org/tests/hematocrit).

A red blood cell count measures the number of red blood cells in the blood. Red blood cell count (*rbcc*) values in the dataset range from a minimum of 2.1 million cells/cmm to a maximum of 8 million cells/cmm. Normal ranges are generally between 4.2 million cells/cmm to 5.9 million cells/cmm. A low red blood cell count is associated with anemia and may be caused by chronic kidney disease. Thus, there should be a correlation between low *rbcc*, *ane*, and chronic kidney disease. More information about red blood cell count can be found [here](https://labtestsonline.org/tests/red-blood-cell-count-rbc).

The hemoglobin test measures the amount of hemoglobin in the blood. Hemoglobin is a protein in red blood cells that carries oxygen. Hemoglobin (*hemo*) values in the dataset range from a minimum of 3.1 g/dL to a maximum of 7.8 g/dL. In general, ranges for adult males are 13.8 g/dL to 17.2 g/dL. For adult females, the average range is 12.1 g/dL to 15.1 g/dL. The dataset does not provide gender information for the patients, so for the sake of analysis the range of 12.1 g/dL to 17.2 g/dL will be considered normal. Low hemoglobin levels may be associated with either anemia or chronic kidney disease. The anemia variable (*ane*) will indicate whether the patient has been diagnosed with anemia. That is, *ane* = yes will indicate a diagnosis of anemia. There should be a correlation between *hemo*, *ane*, and chronic kidney disease. More information on hemoglobin testing can be found [here](https://medlineplus.gov/ency/article/003645.htm).

It is expected that red blood cell count (*rbcc*), hemoglobin (*hemo*), packed cell volume (*pcv*), and anemia (*ane*) will all be correlated because they are each related to the quantity of red blood cells in the patient. Anemia is a [condition](http://www.medilexicon.com/dictionary/3595) in which the blood is deficient in the number of red blood cells, the amount of hemoglobin, and/or the volume of packed red blood cells. Thus, *ane* is dependent upon *rbcc*, *hemo*, and *pcv*. As mentioned earlier, all four of these variables may have a correlation to chronic kidney disease.

The two primary causes of chronic kidney disease are diabetes and hypertension. Thus, it is hypothesized that chronic kidney disease will be most strongly correlated with these two variables. A diagnosis of hypertension (*htn*) will be indicated by *htn* = yes. A diagnosis of diabetes mellitus(*dm*) will be indicated by *dm* = yes.

Cardiovascular disease and/or anemia can be complications of chronic kidney disease. The presence of coronary artery disease in the dataset will be indicated by *cad* = yes. There may be a correlation between *cad* and chronic kidney disease. The presence of anemia will be indicated by *ane* = yes. There may be a correlation between *ane* and chronic kidney disease.

Loss of appetite or swelling of the feet and ankles can be signs of chronic kidney disease. Loss of appetite in the dataset will be indicated by *appet* = poor. There may be a correlation between *appet* and chronic kidney disease. Swelling of the feet and ankles (i.e., pedal edema) will be indicated by *pe* = yes. There may be a correlation between *pe* and chronic kidney disease.

The variable *class* in the dataset indicates whether or not the patient has chronic kidney disease. The presence of chronic kidney disease will be represented as *class* = ckd whereas the absence of chronic kidney disease will be represented as *class* = notckd.

Misspellings and Variations in Values
-------------------------------------

The factors and their levels were as expected There were no misspelling or variants that needed to be cleaned. For example, bacteria (*ba*) was a factor with two levels (*notpresent*, *present*). There were no variations in the representation of *notpresent*.

Renaming and Changing Data Types
--------------------------------

The first column contains the row number. In this way, a patient is assigned a unique number. It serves as the patient identifier within the dataset. The first column is currently named *X*. It will be renamed *Patient* to enhance readability. The remaining column names are short, simple, and descriptive so they will not be changed.

Check for Duplicates
--------------------

Personally identifying information is not included within the dataset. Thus, there is no way of knowing for certain if there are duplicates.

Missing Values
--------------

Table 1: Missing Values

|                       Variable|  Number of Missing Values|
|------------------------------:|-------------------------:|
|          Red blood cells (rbc)|                       152|
|    Red blood cell count (rbcc)|                       131|
|  White blood cell count (wbcc)|                       106|
|                Potassium (pot)|                        88|
|                   Sodium (sod)|                        87|
|       Packed cell volume (pcv)|                        71|
|                 Pus cells (pc)|                        65|
|              Hemoglobin (hemo)|                        52|
|                     Sugar (su)|                        49|
|          Specific gravity (sg)|                        47|
|                   Albumin (al)|                        46|
|     Blood glucose random (bgr)|                        44|
|                Blood urea (bu)|                        19|
|          Serum creatinine (sc)|                        17|
|            Blood pressure (bp)|                        12|
|                            Age|                         9|
|          Pus cell clumps (pcc)|                         4|
|                  Bacteria (ba)|                         4|
|             Hypertension (htn)|                         2|
|         Diabetes mellitus (dm)|                         2|
|  Coronary artery disease (cad)|                         2|
|               Appetite (appet)|                         1|
|               Pedal edema (pe)|                         1|
|                   Anemia (ane)|                         1|
|                  Class (class)|                         0|

As shown in Table 1, some variables have a large number of missing values. There are only 400 observations in the dataset. That means *rbc* and *rbcc* have 38% and 33%, respectively, of their values missing. Each observation represents lab test results or clinical observations for a particular patient. Thus, it does not make sense to fill in missing values with a mean or median. Furthermore, information regarding the variance could be lost with this method. For now, no columns will be removed from the original dataset. An attempt will be made to find a statistical model that will accommodate the large number of missing values.

If a appropriate statistical model cannot be found, columns may need to be removed. In some cases it may still be possible to obtain meaningful information even with columns removed. For example, *rbc*, *rbcc*, *pcv*, and *hemo* have 38%, 33%, 18%, and 13% of their values missing, respectively. However, these variables are all indicators of the number of red blood cells in a blood sample at a single point in time. Similar information can be found within *ane* which signifies that a patient has been diagnosed with anemia. Anemia is a [condition](http://www.medilexicon.com/dictionary/3595) in which the blood is deficient in the number of red blood cells, the amount of hemoglobin, and/or the volume of packed red blood cells. Anemia has only 1 missing value in the dataset.

Outliers
--------

For the sake of analysis, it must be assumed that all laboratory tests and clinical observations accurately reflect the patient's condition. It is possible that an extremely ill patient may have test results that are outside of an expected range of values. If the results are accurate, then there are no outliers. That is, the data reflects the patient's condition at a certain point in time. However, descriptive statistics and histograms will be used to check for extreme outliers. Certain values in a particular column may not make sense. An extreme outlier of that nature would need to be discounted from the analysis.

The following variables showed outliers in their histograms.

![](CKD_Data_Wrangling_Summary_files/figure-markdown_github/unnamed-chunk-1-1.png)![](CKD_Data_Wrangling_Summary_files/figure-markdown_github/unnamed-chunk-1-2.png)![](CKD_Data_Wrangling_Summary_files/figure-markdown_github/unnamed-chunk-1-3.png)![](CKD_Data_Wrangling_Summary_files/figure-markdown_github/unnamed-chunk-1-4.png)![](CKD_Data_Wrangling_Summary_files/figure-markdown_github/unnamed-chunk-1-5.png)

For now, these outliers will be retained. The analysis will assume that all tests and clinical observations were performed correctly and that the outliers are due to the illness of the patient.

References
----------

Blood pressure chart: What your reading means. (2018, March 20). Retrieved from <https://www.mayoclinic.org/diseases-conditions/high-blood-pressure/in-depth/blood-pressure/art-20050982>

Malkina, A. Chronic kidney disease. (2017, March). Retreived from <https://www.merckmanuals.com/professional/genitourinary-disorders/chronic-kidney-disease/chronic-kidney-disease>

Mayo Clinic. Chronic kidney disease. (2018, March 8). Retrieved from <https://www.mayoclinic.org/diseases-conditions/chronic-kidney-disease/symptoms-causes/syc-20354521>

McMillan, J. I. Chronic Kidney Disease. (n.d.). Retrieved from <https://www.merckmanuals.com/home/kidney-and-urinary-tract-disorders/kidney-failure/chronic-kidney-disease>

Medical definition of complete blood count. (2016, May 13). Retrieved from <https://www.medicinenet.com/script/main/art.asp?articlekey=9937>

Point of Care Diagnostics. Interpretation of uninalysis results. (n.d) Retreived from <https://www.pocd.com.au/core/media/media.nl/id.121258/c.3923593/.f?h=6f19962953ef97a31b1d>

Shah, A. P. Evaluation of the renal patient (2016, November). Retrieved from <https://www.merckmanuals.com/professional/genitourinary-disorders/approach-to-the-genitourinary-patient/evaluation-of-the-renal-patient#1152664>

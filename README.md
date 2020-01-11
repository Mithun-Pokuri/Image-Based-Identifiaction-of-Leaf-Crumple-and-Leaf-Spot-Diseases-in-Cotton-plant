# Image-Based-Identifiaction-of-Leaf-Crumple-and-Leaf-Spot-Diseases-in-Cotton-plant
MatLab, R Studio
Abstarct:
Identification of plant diseases based on images derived from computer vision is a major requirement for smart agriculture. 
Conventional algorithms warrant large dataset for better accuracy. They perform well with large variation in color or explicit
probes on a specific disease. This paper considers 4 major diseases of cotton plants with a combination of images with and without
color variation. This paper adapted image processing algorithms to extract precise features for classification, highly preferred and
apt, when the dataset sizes are limited. Verification results of the proposed method validate its rationale and viability.


>> The major diseases related to cotton leaves are Myrothecium Leaf  Spot, Alterneria Leaf  Spot, Leaf  Crumple, Cercospora Leaf Spot and are common to all the major cultivated species.

>> The leaf images are captured using cameras and processed to extract features that will help in identification of diseases.

>> Various Machine learning algorithms have emerged to increase the accuracy of the system.


1.The features are extracted from the image which is obtained by multiplying HSI image and connected components image and stored as features dataset.

2.In features dataset 70% of the data is taken as training set and 30%  of the data is taken as testing set.  

3.Class labels a, c,  m are  Alternaria leaf spot, cercospora leaf spot and Myrothecium leaf spot respectively. 

4.KNN,Naive Bayes and decision tree classifiers are applied to this dataset.


Conclusion:
For leaf spot diseases, it is observed that accuracy of Decision tree, Naive Bayes and KNN are 81.82%, 80% and 71.43% respectively.
Naive Bayes and Decision Tree gives high accuracy.

For the crumple disease identification, the gradient of the input image is calculated. 
Standard deviation of gradient magnitude and gradient direction are considered as features and the leaf is classified accordingly.

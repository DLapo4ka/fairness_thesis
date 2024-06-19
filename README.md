# Group Fairness for Multiple Group Scenario in Text Classification
This page contains materials for the thesis of **Daria Lapko**, a 4th year student of the Bachelor's degree program in Data Science and Business Analytics at the Faculty of Computer Science.

University: Higher School of Economics, Moscow, Russian Federation

Defence date: 5/6/2024

Grade: 8/10

## Abstract
This thesis investigates the problem of intersectional debiasing in text classification models, aiming to mitigate biases that arise from the intersection of multiple demographic attributes like gender, race, age, and country. Existing debiasing techniques often focus on single attributes in isolation, overlooking important sources of unfairness that manifest at the intersections of these attributes. To address this gap, the thesis proposes using a joint attribute that encodes the combinations of protected attributes into a single variable. This allows directly optimizing for fairness across intersectional subgroups rather than just individual attributes. Three debiasing methods are evaluated: Least-squares Concept Erasure (LEACE), Adversarial training (Adv), and Balanced Training with Equal Opportunity (BTEO). These techniques are applied to the Multilingual Twitter Corpus (MTC) dataset, which contains hate speech annotations along with inferred author demographics. The thesis tests three key hypotheses: 1) Debiasing on single attributes is insufficient to substantially improve fairness on the joint attribute, 2) Debiasing on a single attribute can improve fairness on the joint attribute, and 3) There exist correlations between biases in different attributes that can be leveraged for cross-attribute debiasing. Experiments are conducted using the FairLib framework, with accuracy and fairness metrics like TPR-GAP and Distance to Optimum (DTO) evaluated across different debiasing methods and attributes. The results provide insights into the effectiveness of intersectional debiasing and the trade-offs between fairness and performance. The thesis concludes with a discussion of future research directions to further advance the state-of-the-art in fair and inclusive text classification.

## Key words: 
fairness, intersectional debiasing, protected attributes, joint attribute, text classification, natural language processing

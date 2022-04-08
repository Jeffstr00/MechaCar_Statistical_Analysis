# MechaCar: Statistics and R

## Overview

Jeremy is the new head of data analytics for AutosRUs, a car production company.  When the company's newest prototype, MechaCar, runs into production issues, management turns to Jeremy (who in turn asked us to help him) to see if he can use analytics to assist in looking into the issue.  Assuming they can resolve those problems, they also ask for a statistical study to be designed that can compare vehicle performance of MechaCar to that of the competition.

## Results

### Linear Regression to Predict MPG

![Linear Regression](https://github.com/Jeffstr00/MechaCar_Statistical_Analysis/blob/main/Resources/linear_regression.png)

In other words, our multiple linear regression model is:
mpg = -104 + 6.267(vehicle_length) + .001245(vehicle_weight) + .06877(spoiler_angle) + 3.546(ground_clearance) -3.411(AWD)

![Linear Regression Summary](https://github.com/Jeffstr00/MechaCar_Statistical_Analysis/blob/main/Resources/linear_regression_summary.png)

* The Pr(>|t|) column displays individual variable p-values, or the probability that the corresponding coefficient contributes a random amount of variance to the model.  With high (greater than .05) p-values, that means that vehicle weight (though somewhat borderline), spoiler angle, and all wheel drive have a largely random impact on the resulting miles per gallon.  On the other hand, this means that, with their exceptionally small (less than .05) p-values, vehicle length, ground clearance, and the intercept all have a statistically significant impact on mpg.

* The p-value of our linear regression model is 5.35x10<sup>-6</sup>.  As this is much, much smaller than our assumed significance level of 0.05%, we can safely say that the slope of the linear model is not considered to be zero.

* While there is no hard and fast rule for declaring whether a linear model is effective or not, with a relatively high r-squared value of 0.71 (out of a maximum 1.0), most would say that this is an effective model.  That means that 71% of the variability of mpg is explained using the model and the given variables.

### Summary Statistics on Suspension Coils

![Suspension Summary](https://github.com/Jeffstr00/MechaCar_Statistical_Analysis/blob/main/Resources/suspension_summary.png)

The design specifications for the MechaCar suspension coils dictate that the variance of the suspension coils must not exceed 100 pounds per square inch.  With a variance of 62.29 pounds per square inch, that means that, overall, there does not seem to be a problem, as the variance is within the allowed threshold.  However, what about when you look at it broken down by manufacturing lot?

![Lot Suspension Summary](https://github.com/Jeffstr00/MechaCar_Statistical_Analysis/blob/main/Resources/lot_suspension_summary.png)

Now the issue becomes clear.  While Lot1 and Lot2 perform well (with variance well below the allowed 100psi), that is not the case for Lot3.  Their variance is 170.29psi, or nearly twice what is allowed.  While the former two perform well enough to reign in the bad results from Lot3 and make it appear as if things are going okay when looking at everything together, when you separate them, it becomes clear that Lot3 is causing the production issues.

### T-Tests on Suspension Coils

![T-Test](https://github.com/Jeffstr00/MechaCar_Statistical_Analysis/blob/main/Resources/ttest.png)

When looking at results of the three lots combined, things overall seem fine, but with a little area of concern.  With a p-value of 0.060, this is above .05, so we can safely say that we cannot reject the alternative hypothesis that the true mean is equal to 1500.  With 95% certainty, we can claim that the mean is very close to 1500, specifically between 1497.5 and 1500.1.  However, with those numbers slightly skewed low (as opposed to being, for instance, more even with 1499 and 1501), that is a little bit concerning.  Maybe we should look at results of the lots individually?

![T-Test: Lot 1](https://github.com/Jeffstr00/MechaCar_Statistical_Analysis/blob/main/Resources/ttest_lot1.png)

Lot1 is about as close to perfection as you can get.  With a p-value of 1, which is obviously higher than 0.05, we definitely can't reject the alternative hypothesis that the true mean is equal to 1500.  With 95% certainty, we can claim that the true mean is somewhere between the indredibly small range of 1499.72 - 1500.28.

![T-Test: Lot 2](https://github.com/Jeffstr00/MechaCar_Statistical_Analysis/blob/main/Resources/ttest_lot1.png)

While not as impressive as Lot1, Lot2 still performed admirably.  It provided a mean of 1500.2, which is very close to the ideal 1500.  The p-value of .61 is higher than .05, so we can say with 95% certainty that the true mean lies somewhere between 1499.42 and 1500.98.

![T-Test: Lot 3](https://github.com/Jeffstr00/MechaCar_Statistical_Analysis/blob/main/Resources/ttest_lot1.png)

However, Lot3 does not perform as well as the first two.  With a p-value of 0.04, which falls below the 0.05 threshold, we are 95% certain that the mean at this lot is not actually 1500.  In fact, it appears to be 1496.14, or somewhere between 1492.43 and 1499.85.  So, even in a best case scenario, that number falls below the desired 1500.  As a result, there is a less than 5% chance that the mean at Lot3 is 1500 like it should be.

## Study Design: MechaCar vs Competition

One important factor that people often look into when choosing to buy a car is its eventual resale value.  This is not only important to people as it shows how much money they should expect to get in return when it comes time to trade in for a new car, but it provides a good representation of how much value the vehicle still provides at that point in its life.  Is the vehicle still performing well?  How much does it cost to maintain the car?  Does it still look cool, or has it lost its edge and become outdated?  All of this will be reflected in the resale value.

As a result, being able to project what that resale value will be, and how it can be affected, would be highly beneficial to AutosRUs.  As a result, we will attempt to project resale value by performing a multiple linear regression analysis.  Using different variables (original cost, 0-60mph time, average yearly maintenance, spaciousness of vehicle, safety ratings, etc.), we will see how accurately we can predict resale value.

In order to see how accurate our model is, we will want to conduct a T-test.  Calculating R-squared will tell us how much of the resale price the variables in our model were able to predict vs how much came down to randomness or outside factors, and a p-value hopefully below 0.05 will let us know that we can be confident in our results.  Additionally, performing this analysis should reveal just how important each factor is in determining resale value.  That way, the company can see what they should focus their efforts on if they aim to improve resale value.

For this study, we would have:
* Null Hypothesis: there is a relationship between the predictor variables (original cost, 0-60mph time, etc.) and the response (resale value).
* Alternative Hypothesis: there is no relationship between the predictor variables and the response.
# MATLAB Fall 2014 - Research Plan 

> * Group Name: Partizani
> * Group participants names: Bjelobrk Zoran, W\"alchli Ruben
> * Project Title: Refinement of a Inter-Group Violence Model

## General Introduction

Throughout human history there has always been violent conflicts between members of different ethno-religous groups. These events have often led to the death of many individuals. One very drastic example is the series of civil wars during the decay of former Yugoslavia. To possibly prevent such tragedies from happening in the future, it is crucial to understand the dynamics of those conflicts. In the course of this work, an existing model for the dynamics of ethnic conflicts from literature is taken and new interactions are introduced to make it more realistic.

## The Model

The model is made up of two categories of actors: civilians and cops. The civilians are further divided into three different ethnic groups. This is the first expansion compared to the model described in literature. In our opinion, a situation with more than two ethnic groups is particularly interesting.

The only task of the cops is it to prevent inter-group violence from happening. They do this via arresting civilians, who have attacked members of an other ethnic group. The arrested civilians are transferred to the jail for a random amount of time and then again released on to the map.

The civilians will engage in aggression agains other ethnicities based on their perceived hardship, the perceived legitimacy of the other groups, their assumed arrest probability, their individual risk aversion and their violence threshold. The hardship of the individual civilians is different as well as their risk aversion. The legitimacy of the other groups however is equal for all individuals of one group. In contrast to the model described in literature, in our model the violence threshold is also different for every individual civilian. This is the second expansion/modification of the base model. By this, we want to be able to describe different individual levels of extremism.

The model contains a simple population dynamic. All civilians clone themselves onto a empty neighboring field with a certain (small) probability at the end of a turn. The age of the individual civilians is recorded and they are removed from the map at the end of the turn, if their age has reached their individual life expectancy.

The results of the simulation will be quantified by measuring the cumulative number of killed civilians and arrested civilians. As "genocide" will be defined a situation, in which one or two other groups are completely extinguished by one of the three groups. Parameters like the population density, the distribution of the population into the three ethnic groups and the reciprocal perceived legitimacy values will be varied and their effects on the results of the simulation will be studied.

Such models are always a strong abstraction of reality. However, it should be possible to draw relevant conclusions from a well-designed model.

## Fundamental Questions

What different dynamics do emerge, when a third ethnic group is introduced into the scenario compared to the results presented in literature?

What changes in the result of the simulation, if the violence threshold becomes a characteristic quantity of the individual?

What effect do the values aforementioned parameters have on the results of the simulation?

## Expected Results

In general, it is hard to predict the outcome of the simulation just based on the characteristics of the agents and the laws governing interaction. It might be that the third ethnic group increases the overall amount of violence, because aggressive individuals more like will find a victim. On the other hand decreases the additional ethnic groups the local concentration of active civilians of one group and increases therefore the estimated arrest probability of the individual civilians, which would prevent violence from happening. We imagine that in our model, extreme individuals (low violence threshold) will engage easily in violence and therefore will also be arrested more often than more moderate individuals. Due to the population dynamics of the model, this will probably lead to a overall decrease of the extremism in the model society.

## References 

Epstein, J. M.: "Modeling civil violence: An agent-based computational approach", 2002, Colloquium. This reference contains the base model upon this project will be built.

## Research Methods

The used method is an agent-based model.

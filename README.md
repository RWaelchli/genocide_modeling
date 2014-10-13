# MATLAB Fall 2014 - Research Plan 

> * Group Name: Partizani
> * Group participants names: Bjelobrk Zoran, W\"alchli Ruben
> * Project Title: Refinement of a Inter-Group Violence Model

## General Introduction

Throughout human history there has always been violent conflicts between members of different ethno-religous groups. These events have often led to the death of many individuals. One very drastic example is the series of civil wars during the decay of former Yugoslavia. To possibly prevent such tragedies from happening in the future, it is crucial to understand the dynamics of those conflicts. In the course of this work, an existing model for the dynamics of ethnic conflicts from literature is taken and new interactions are introduced to make it more realistic.

(States your motivation clearly: why is it important / interesting to solve this problem?)
(Add real-world examples, if any)
(Put the problem into a historical context, from what does it originate? Are there already some proposed solutions?)

## The Model

The model is made up of two categories of actors: civilians and soldiers. The civilians are further divided into three different ethnic groups. This is an expansion compared to the model described in literature. In our opinion, a situation with more than two ethnic groups is particularly interesting.

The only task of the soldiers is it to prevent inter-group violence from happening. They do this via arresting civilians, who have attacked members of an other ethnic group. The arrested civilians are transferred to the jail for a random amount of time and then again released on to the map.

The civilians will engage in aggression agains other ethnicities based on their perceived hardship, the perceived legitimacy of the other groups, their assumed arrest probability, their individual risk aversion and their violence threshold. In our model, the violence threshold is a characteristic of the single civilian in contrast to being a global parameter for all civilians in the literature model. By this, we hope to incorporate also the individual levels of extremism of the civilians into the model.

In contrast to the reference model from the literature, the spreading of information about outbursts of violence and its effect on the perceived hardship and legitimacy of the individuals will also be investigated. In our opinion, changes in those variables due to previous actions of the members of the different ethnic groups is key for the propagation of the simulation.

In our model, acts of violence by members of one group decrease the legitimacy of that group in the eyes of the members of the other groups. On the other hand, the perceived legitimacy of a group can increase in our model due to arrests of violent members of that group. The hardship of the members of a group increases upon message of the murder of other group members and decreases upon message of murders committed by other group members (retaliation effect). In a further expansion of our model, the dynamic of the perceived hardship is also affected by the individuals level of extremism. Extreme members of a group will experience a strong increase in hardship when they gain knowledge of a murdered companion. On the other hand they will only experience a small decrease in hardship upon the murder of a member of a rival group.

The spreading of information about acts of violence and about arrests can be modeled in different ways. In the first case, all civilians on the map have access to the same amount of information. In a second case the information spreading happens on two stages: locally and globally. The dynamics are then different on those two scales. The distribution of information is always associated with a certain degree of error. The effect of this "noise" will be examined in a further expansion of the model.

The model contains a simple population dynamic. All civilians clone themselves onto a empty neighboring field with a certain (small) probability at the end of a turn. The age of the individual civilians is also recorded and they are removed from the map at the end of the turn if their age has reached their individual life expectancy.

The goal is to identify the effects of the new parameters and interactions introduced stepwise into the model compared to the model from the literature. Moreover, we will look for critical parameter values that separate stable situations from genocides.

Those social-interaction models are always a strong simplification of the real-world dynamics. However, they allow the investigation of certain underlying mechanisms of such events. One has to find a fine balance between simplicity and complexity of the model. A too complex model can be useless, when the effect of the single parameters on the outcome of the simulation becomes unclear. We hope that our expanded model still fulfills the criteria of a reasonable complex model.

(Define dependent and independent variables you want to study. Say how you want to measure them.) (Why is your model a good abstraction of the problem you want to study?) (Are you capturing all the relevant aspects of the problem?)


## Fundamental Questions

What different dynamics do emerge, when a third ethnic group is introduced into the scenario compared to the results presented in literature?

Is our expansion of the model concerning the effect of violent events and arrests on the individual perceived legitimacy of the other ethnic groups and the individual perceived hardship realistic? What effect on the outcome of the simulation do such additional interactions have compared to the literature model?

How can information spreading be incorporated realistically into such a model? What effect does uncertainty in the transmission of information on the outcome of the simulation?

What values of (new) parameters separate stable outcomes of the simulation from those with extensive violence?

(At the end of the project you want to find the answer to these questions)
(Formulate a few, clear questions. Articulate them in sub-questions, from the more general to the more specific. )


## Expected Results

In general, it is hard to predict the outcome of the simulation just based on the characteristics of the agents and the laws governing interaction. We imagine that in our model, extreme individuals (low violence threshold) will engage easily in violence and therefore will also be arrested more often than more moderate individuals. Due to the population dynamics of the model, this will probably lead to a overall decrease of the extremism in the model society. Ultimately violence should vanish.

Interesting is also the effect of information spreading.  The effects on perceived legitimacy and hardship are expected to balance each other out in the long run, but it is hard to predict what dynamics they cause. In the case of consideration of the extremism of the individuals, when the overall extremism decreases during the simulation, the perceived hardship of the individuals on the map should become more and more constant.

(What are the answers to the above questions that you expect to find before starting your research?)


## References 

(Add the bibliographic references you intend to use)
(Explain possible extension to the above models)
(Code / Projects Reports of the previous year)


## Research Methods

The used method is an agent-based model.

(Cellular Automata, Agent-Based Model, Continuous Modeling...) (If you are not sure here: 1. Consult your colleagues, 2. ask the teachers, 3. remember that you can change it afterwards)


# data-lake-collab

The aim of this project is to help data stakeholders collaborate and realize solutions to problems that previously would've required unfettered access to sensitive information.

Huge thanks to the OpenMined community!

## Motivation

As Andrew Trask from OpenMined puts it (and I'm paraphrasing here): there are cases where public information is found in private information. The canonical example given by Trask is of building a cancer detection model using patient data: the model itself is not unique to any specific person but the individual data point is unique. This private information is collected under the explicit trust (sometimes implicit) that the information won't be divulged (through any means). The conventional methods to keep this promise involved anonymizing data. However, the industry has denounced the practice since there were cases where participants' private information was divulged despite the dataset being anonymized. It stands that much good can come from using private information but it must be done judiciously; with a platform that preserves this privacy and also allows groups to collaborate, we expect groups to share data to build smarter and more robust models without giving up ownership of their data. 

## Introduction

We're building a plugin for Spark that can split model training to different workers, 


## Internals

We employ MPC architectures on Apache Spark. We picked Apache Spark due to its popularity and large community: we can integrate existing workflows on top of our platform. Moreover, we expect large latencies with 


### List of TODO items

* docker multistage builds



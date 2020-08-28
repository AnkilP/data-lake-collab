# data-lake-collab

The aim of this project is to help data stakeholders collaborate and realize solutions to problems that previously would've required unfettered access to sensitive information.

Huge thanks to the OpenMined community!

## Motivation

As Andrew Trask from OpenMined puts it (and I'm paraphrasing here): there are cases where public information is found in private information. The canonical example given by Trask is of building a cancer detection model using patient data: the model itself is not unique to any specific person but the individual data point is unique. This private information is collected under the explicit trust (sometimes implicit) that the information won't be divulged (through any means). The conventional methods to keep this promise involved anonymizing data. However, the industry has denounced the practice since there were cases where participants' private information was divulged despite the dataset being anonymized. It stands that much good can come from using private information but it must be done judiciously; with a platform that preserves this privacy and also allows groups to collaborate, we expect groups to share data to build smarter and more robust models without giving up ownership of their data. 

## Introduction

We're building a plugin for Spark that can split model training to different workers. As the name implies, the data will be stored on the data lakes.

### Dependencies for local development

* Helm
* Kubernetes
* Docker

### Setup
For our local setup, we use minikube

```sh
minikube start
kubectl apply -f namespaces-spark.yaml
helm repo add incubator http://storage.googleapis.com/kubernetes-charts-incubator
helm install incubator/sparkoperator --generate-name --namespace spark-operator --set sparkJobNamespace=default

```
For more information on the first step or for more granularity in setting up the spark oeprator, consult the website with the [helm chart](https://github.com/helm/charts/tree/master/incubator/sparkoperator).

I've already pushed the docker image to docker hub (ankilp/spark-mpc) so we won't need to build the docker image again.

Note that the spark operator is still experimental for Python so the image must always be pulled.

Finally, we run a simple program (alice.py) using mpc.yaml:

```sh
kubectl apply -f mpc.yaml
kubectl describe pods pyspark-pi 
```

You should see the events at the bottom.

## Internals

We employ MPC architectures on Apache Spark. We picked Apache Spark due to its popularity and large community: we can integrate existing workflows on top of our platform. Moreover, we expect large latencies with streaming data so we would like to have a separate offering for that (most likely Spark Streaming but that is very far into the future).




### List of TODO items

* docker multistage builds
* use spark streaming for streaming service


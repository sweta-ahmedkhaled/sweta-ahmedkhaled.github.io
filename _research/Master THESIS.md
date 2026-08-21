---
title: Master Thesis
year: "2027"
order: 1
tagline: Brain Tumor Prognosis
---
I have joined **Rashed Lab**, under the supervision of **[Dr. Essam Rashed](https://scholar.google.com/citations?hl=en&user=ihTTcfkAAAAJ)** and **[Dr. Ghada Khoriba](https://scholar.google.com/citations?user=jwTBsIIAAAAJ&hl=en)**.

Dr. Essam has a challenging research project:

**Efficient and Private Large Multi-Modal Model Training and Inference over Heterogeneous Edge-Cloud Networks**

Two hard constraints make this nontrivial:

1. **Statistical heterogeneity** — data across different edge clients is not **identically distributed**: different hospitals, scanners, users, and domains. This breaks the standard federated-learning assumption of homogeneous clients.
    
2. **Privacy** — sensitive data such as **patient records and personal images** cannot leave the device or institution in raw form. Even gradients or model updates can potentially leak private information through attacks such as gradient inversion.
    

The [project summary](https://projectdb.jst.go.jp/grant/JST-PROJECT-25126435/) divides the work into two main sides:

- **Japan side (Cao / Su / Rashed):** privacy-preserving techniques through **Federated Learning**, particularly **Metric Differential Privacy** and **Trusted Execution Environments (TEE)**.
    
- **Singapore side (Lim et al.):** efficient inference using **Mixture of Experts (MoE)** and **Retrieval-Augmented Generation (RAG)** to dynamically allocate computation between edge and cloud.
    

The end goal is a jointly developed **high-performance, low-latency, privacy-preserving AI system**.

---

## How I was introduced to the problem

When I first met Dr. Essam, he gave me three papers and oriented me toward an interdisciplinary research area:

**Method → Literature Review → Dataset**

1. **Method — FedStack**  
    How can we handle federated clients that are architecturally/statistically heterogeneous instead of forcing everyone into one shared model?
    
2. **Literature — Thrasher Review**  
    What has **Multimodal Federated Learning in Healthcare** already solved, and more importantly, **what is still missing?**
    
3. **Dataset — Flouri / PROTEAS**  
    A real, recently published, multi-institutional dataset containing **MRI, clinical, and radiomic data**. Its six source centers naturally introduce heterogeneity through different scanners, protocols, and patient populations.
    

So there is an interesting connection:

**FedStack → Multimodal Federated Learning → PROTEAS**

The method gives us a way to think about heterogeneity, the literature tells us where the research gap may be, and the dataset gives us a concrete clinical testbed.

---

## The Dataset and the Bigger Question

The dataset is rich and enables many interesting downstream capabilities.

One of the most exciting questions is:

> **Given a patient's past trajectory and treatment, can we predict the next MRI scan?**

This shifts the problem from simply analyzing a single MRI to understanding **how the disease evolves over time** and whether that evolution can be predicted from the information we already have.

And now, we are in the phase where we are **investigating and assessing whether this dataset can actually support such a task**.

For now, we have left the **heterogeneous-client / federated setting** for a later stage.

The immediate question is simpler:

> **Does the dataset contain enough information to make this prediction problem feasible and scientifically meaningful?**

If the answer is yes, then we can later bring back the harder question:

> **Can we solve this problem across heterogeneous institutions while preserving privacy and remaining computationally efficient?**
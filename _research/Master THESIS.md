---
title: Master Thesis
year: "2027"
order: 1
tagline: Brain Tumor Prognosis
---
I have joined **Rashed Lab**, under the supervision of **Dr. Essam Rashed** and **Dr. Ghada Khoriba**.

## 1. The Broader Research Challenge

Dr. Essam's research focuses on:

> **Efficient and Private Large Multi-Modal Model Training and Inference over Heterogeneous Edge-Cloud Networks**

The challenge is driven by two fundamental constraints:

- **Statistical heterogeneity:** data across edge clients—e.g., hospitals, sensors, or users—is **non-IID**, with different distributions, scanners, protocols, and populations.
    
- **Privacy:** sensitive data cannot leave its institution/device in raw form, while even gradients or model updates may leak information through attacks such as gradient inversion.
    

The JST project divides the research direction into two complementary components:

- **Japan — Privacy-preserving training:** Federated Learning, Metric Differential Privacy, and Trusted Execution Environments (TEE).
    
- **Singapore — Efficient inference:** Mixture-of-Experts (MoE) and Retrieval-Augmented Generation (RAG) for dynamically distributing computation between edge and cloud.
    

The ultimate goal is a **high-performance, low-latency, privacy-preserving multimodal AI system**.

## 2. My Initial Research Direction

When I first met Dr. Essam, he gave me three papers that implicitly defined a research path:

| Role           | Work                                                                        | Purpose                                                                                                      |
| -------------- | --------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------ |
| **Method**     | **FedStack**                                                                | Handling heterogeneous federated clients rather than forcing a single shared model                           |
| **Literature** | **Thrasher et al.** — Multimodal Federated Learning in Healthcare: A Review | Understanding what healthcare MFL has solved and where gaps remain                                           |
| **Dataset**    | **Flouri et al. — PROTEAS**                                                 | A real-world, multi-institutional MRI + clinical + radiomics dataset with natural cross-center heterogeneity |

The connection is therefore:

**Federated Heterogeneity → Multimodal Healthcare → Real Clinical Dataset**

## 3. The PROTEAS Dataset as a Research Testbed

The PROTEAS dataset is particularly interesting because it provides rich longitudinal information across multiple institutions and modalities.

Its natural variation across centers—different **scanners, acquisition protocols, and patient populations**—makes it a realistic environment for studying the type of heterogeneity targeted by the broader research project.

More importantly, the dataset enables several clinically meaningful downstream tasks.

One particularly exciting question is:

> **Given a patient's past MRI trajectory and treatment history, can we predict what the patient's next scan will look like?**

This moves the problem from static prediction toward **longitudinal prognosis / trajectory prediction**.

## 4. Current Phase

At this stage, we are **not yet focusing on the heterogeneous-client/federated setting**.

Instead, we are investigating whether the dataset itself contains enough information to support the desired downstream prediction task.

Our current questions are therefore:

1. **What can actually be predicted from the longitudinal MRI data?**
    
2. **How much predictive information comes from the imaging trajectory itself?**
    
3. **How much additional information is provided by treatment and clinical variables?**
    
4. **Are there additional predictive features that can be extracted from the raw imaging/DICOM data?**
    
5. **Does the dataset contain sufficient longitudinal coverage, sample size, and temporal consistency to support a reliable prognosis task?**
    

Only after establishing that the **prediction problem is feasible and scientifically meaningful** does it make sense to introduce the next layer:

> **How can this prediction be performed efficiently and privately across heterogeneous institutions?**

That provides a natural progression from the **dataset investigation**, to the **clinical prediction problem**, and eventually to the broader **heterogeneous federated multimodal learning** research direction.
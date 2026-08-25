---
title: White Blood Cell Classification
year: "2026"
order: 2
tagline: Kaggle Competition ــ Under Severe Class Imbalance and Domain Shift (WBCBench2026)
---
The Competition [Website](https://xudong-ma.github.io/WBCBench2026-Robust-White-Blood-Cell-Classification/#about)
The Challenge [Paper](https://www.semanticscholar.org/reader/8050b0539809b1e4e545ff49a73cfb3d0775f7d6)


**WBCBench 2026: A Challenge for Robust White Blood Cell Classification Under Class Imbalance and Domain Shift**

It was a wonderful Experience as My Team Ranked First on the Leaderboard based on Macro-F1 Primary Metric

Our Proposed [Methodology](https://canva.link/xao9mo9kiqwa44v)(ies)

Our Best Trials handles the Challenge and hits a good results because of:
- Imbalance Handling – Sampler (Controlled Exposure), We control what the model sees per batch to learn morphology, not frequency.
- Applied label smoothing to Cross Entropy during training, which replaces hard one-hot targets with softened targets to reduce overconfidence and improve generalization across visually similar white blood cell classes.


And we were an Amazing Team (**GODA**) who did a lot of collaborated and individual Experiments like a (plenty of arcs) in a War try to hit the Target. and we did! Alhamdullilah 

<img src="{{ '/assets/Yellow Black Bold Minimalist Crime Movie Poster.png' | relative_url }}" alt="WBCBench 2026 poster" width="186">
**GODA TEAM, Omar Shoaib, Gannat, Donia.**


**The Challenge is:**
1. **Domain SHift**
2. **Class Imbalance**

<img src="{{ '/assets/Pasted image 20260823115020.png' | relative_url }}" alt="WBCBench 2026 challenge" width="448">

**The winning Pipeline (belongs NOT to ours):**


<img src="{{ '/assets/Pasted image 20260823114921.png' | relative_url }}" alt="Winning pipeline" width="483">

**Backbones Effects on Results:**

<img src="{{ '/assets/Pasted image 20260823115122.png' | relative_url }}" alt="Backbone effects on results" width="350">

**Ablation Study:**

<img src="{{ '/assets/Pasted image 20260823115207.png' | relative_url }}" alt="Ablation study" width="363">


References:
[Foundation Model Enhanced Hierarchical Learning for White Blood Cell Classification](https://www.semanticscholar.org/paper/Foundation-Model-Enhanced-Hierarchical-Learning-for-Xiao-Chen/7918c6b40cf1c57248b91f7f9e04569c54ba2f11)

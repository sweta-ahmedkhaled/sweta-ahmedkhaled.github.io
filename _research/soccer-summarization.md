---
title: Soccer Video Summarization
year: "2023"
order: 3
tagline: Graduation project. Turning a Full Match into The Few Minutes most Exciting.
---
We have this Challenge as our Graduation Project from Ain Shams University 2023, we just implemented The Methodology of a popular Paper of the Field at this Time. we tried, but unfortunately failed to fine tune it on the Egyptian League Matches due to the low Resource and the low quality of soccer Games in Egypt

The Key Contribution of the Paper was this Fabulous Loss Function
<img src="{{ '/assets/Pasted image 20260824034107.png' | relative_url }}" alt="Context-aware loss function" width="303">
Context-aware loss function. it was a novel loss designed to leverage the **temporal context around an action spot** (at a temporal shift of 0). they heavily penalize the frames far-distant from the action and decrease the penalty for those gradually closer.
they did not penalize the frames just before the action to avoid providing misleading information as its occurrence is uncertain, but we heavily penalize those just after, as the action has occurred.

The Proposed Methodology was:
<img src="{{ '/assets/Pasted image 20260824034321.png' | relative_url }}" alt="Action spotting pipeline" width="468">

**Pipeline** for action spotting. 
We propose a network made of a frame feature extractor and a temporal CNN outputting C class feature vectors per frame, a segmentation module outputting per-class segmentation scores, and a spotting module extracting 2 + C values per spotting prediction (i.e. the confidence score s for the spotting, its location t and a per-class prediction).


**The Results were:**
<img src="{{ '/assets/Pasted image 20260824034353.png' | relative_url }}" alt="Soccer summarization results" width="313">
**Time Axis for Actions (Output)**

<img src="{{ '/assets/Pasted image 20260824034416.png' | relative_url }}" alt="Action time axis" width="301">
**Action Classification metrics.**


The Paper is [here](https://arxiv.org/pdf/1912.01326)
The Code is [here](https://github.com/cioppaanthony/context-aware-loss)

References:

The State-of-the Art of such Interesting Topic is:
[Benchmark](https://arxiv.org/abs/2509.01439)

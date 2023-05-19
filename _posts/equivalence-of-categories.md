---
layout: post
title: equivalence of categories
date: 2023-05-18
categories: category-theory
---
An oft-stated characterization of an equivalence of categories is that TFAE:
1. A functor $$F : \mathcal{C} → \mathcal{D}$$ is (the forward direction of) an equivalence of categories
2. $$F$$ is *full*, *faithful*, and *essentially surjective on objects*[^1]

[^1]: the definitions are standard, but the way I remember it is that *faithful* := injective on homsets, *full* := surjective on homsets, *eso* := surjective on objects, up to isomorphism

**pf (1 ⟹ 2):** (you really need to draw the diagrams. I'm not going to try here)

Let $$F : \mathcal{C} → \mathcal{D}$$ be an equivalence of categories.
- wts $$F$$ faithful: assume $$Ff = Fg$$, for $$f, g : \mathcal{C}(A, B)$$.
Then $$F⁻¹Ff = F⁻¹Fg$$.
Let $$α : 1_\mathcal{C} ⇒ F⁻¹F$$ witness that F is an equivalence.
Notice that $$α_B ∘ f = F⁻¹Ff ∘ α_A ⟹ α_B ∘ f ∘ α⁻¹_A = F⁻¹Ff$$,
and similarly $$α_B ∘ g = F⁻¹Fg ∘ α_A ⟹ α_B ∘ g ∘ α⁻¹_A = F⁻¹Fg$$.
Thus $$F⁻¹Ff = F⁻¹Fg ⟹ F⁻¹Fg ∘ α_A ⟹ α_B ∘ f ∘ α⁻¹_A = F⁻¹Fg ∘ α_A ⟹ α_B ∘ g ∘ α⁻¹_A ⟹ f = g$$.[^2]

[^2]: we make use of the fact that natural transformation ⟹ (natural isomorphism ⟺ each point is an isomorphism)

- wts $$F$$ full: Consider $$h : \mathcal{D}(FA, FB)$$.
Then $$α⁻¹_B ∘ F⁻¹h ∘ α_A : \mathcal{C}(A, B)$$
In a roundabout fashion, consider not $$F(α⁻¹_B ∘ F⁻¹h ∘ α_A)$$ directly,
but $$F⁻¹F(α⁻¹_B ∘ F⁻¹h ∘ α_A)$$.
Actually, our proof above that $$F$$ is faithful is symmetric since an equivalence of categories is a symmetric notion, so $$F⁻¹$$ is faithful as well.
Notice that $$F⁻¹F(α⁻¹_B ∘ F⁻¹h ∘ α_A) = α_B ∘ f ∘ α⁻¹_A = F⁻¹h$$,
and since $$F⁻¹$$ is faithful, $$F(α⁻¹_B ∘ F⁻¹h ∘ α_A) = h$$.
- wts $$F$$ eso:
Let $$β : FF⁻¹ ⇒ 1_\mathcal{D}$$ be the other witness that $$\mathcal{C} ≅ \mathcal{D}$$.
$$∀X ∈ \mathcal{D}. β_X$$ witnesses that $$FF⁻¹X ≅ X$$.

**pf (2 ⟹ 1):**

Let $$F$$ be fully faithful and eso.
Define $$F⁻¹$$ st

TODO: I'm tired. This is Awodey p.174

Amalgamated from Awodey and Rhiel's books, and the nlab

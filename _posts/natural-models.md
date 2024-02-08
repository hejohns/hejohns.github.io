---
layout: post
title: Natural Models
date: 2024-02-08
---
We were talking about natural models today,
in the sense of [Awodey](https://arxiv.org/abs/1406.3219).
And I still have yet to read most of the paper,
but I'd always thought that that paper must've been about, well, natural models.
But as far as I can tell, the paper is not about models of homotopy type theory
in a model of homotopy type theory.

(I first wrote "*the* intended model" instead of "a model", but afaik there is no intended model of homotopy type theory-- or many type theories-- anyways, at least not in the sense which will be described below.)

You see, at the end of Enderton's undergraduate set theory book,
he has a small section on *natural models* of set theory.
A natural model is $$V_α ⊆ V$$[^1], that is closed under the set theory axioms.
For example, a natural model of $$Z$$
(ie $$ZF∖\{$$ replacement $$\}$$, as per Enderton)
is some capped off $$V_α$$ that is closed under pairing, union, powersets, etc.

[^1]: To pay respect to the historical development of models of set theory, and since Enderton mentions as much, we take all models to have the standard $$ϵ$$ interpretation. Of course, in general, models $$M ⊆ V$$ need not have the same $$ϵ$$, and even more generally, models need not be subsets of $$V$$.

So you can go though each axiom and check off that $$V_ω$$ is almost a model
of $$Z$$, but actually $$α$$ needs to be a limit ordinal (powerset axiom) above $$ω$$ (infinity axiom), so the smallest $$α$$ is $$2ω$$.

Then Enderton shows that $$V_{2ω} ̸⊧ ZF$$, thus it must not satisfy replacement.
But assuming an inaccessible cardinal $$κ$$, $$V_κ ⊧ ZF$$ (ie the replacement axioms are satisfied as well).

I don't know if this is the canonical proof that replacement is independent of $$Z$$, but it's a nice one,
and when I read this section of Enderton,
it cemented itself as one the all time best things I'd ever read.

To be precise, I should clarify that these results show that
$$V_{2ω} ⊧ Z$$ but $$V_{2ω} ̸⊧ ZF$$, ie $$V_{2ω} ̸⊧ Z + \text{replacement}$$,
thus $$Z ̸⊧ \text{replacement}$$, thus $$Z ̸⊢ \text{replacement}$$.
And $$Z ̸⊢ ¬\text{replacement}$$[^2], since $$Z ̸⊧ ¬\text{replacement}$$,
since $$V_κ ⊧ Z + \text{replacement}$$.

[^2]: ok replacement is an axiom schema or something, but you get the point

Thus replacement is independent of $$Z$$, ie $$ZF$$ is strictly stronger than $$Z$$.
Now, one would ask about $$ZF$$ and $$ZFC$$!

I don't think Enderton makes comment on it in the small section on natural models.
I would think that choice only gives you sets of smaller rank, so any $$V_α$$ is closed under choice? Or at least for nontrivial $$α$$?
I think I've seen that somewhere, but if I'm horribly wrong I'll be quite embarrassed.

In any case, $$V_κ$$ should be a model of $$ZFC$$ then,
which means that Gödel's famous half of the independence of choice
presumably doesn't require inaccessible cardinal assumptions,
and the famous work of Cohen suggests that there's no natural model of $$ZF + $$¬$$C$$-- in addition to the fact that any $$V_α$$ should satisfy choice.

Okay the reasoning in the last paragraph is all backwards, so let's cap it there.

I forgot to write that the notion *natural model* appears to be due to Montague.
I can't seem to find this mentioned in Enderton anymore,
but another Montague fun fact.
At least I usually call it "Montague's notion of natural model".

Hence my confusion with Awodey's reuse of the term.

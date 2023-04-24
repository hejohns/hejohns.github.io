---
layout: post
title: some remarks apropos scripting
date: 2023-04-23
---
- toc
{:toc}

The following is a mix between a (personal) wiki and a post

## Perl

### the good
- I admit that I tend to proselytize Perl for text scripting.
Part of it is because I do find it ergonomic for simple text scripts--
my policy is that it's great for <100 line scripts. And stay away from the OO--,
but also because I think people tend to cast aside perfectly functional tools or ideas that are perceived to be *old*.
I'm a bit of a stalwart on this point.
I refuse to use `tmux` over GNU `screen`, unless I specifically need a feature one has that the other doesn't.
Looking backwards too much has it's own share of problems,
but as far as scripting goes, I stand by that Perl is a solid tool.
- ok, but specifically:
- the $calar-@rray-%ash distinction is quite nice. It's far from (rich) static types, but it's better than nothing.
I suppose nowadays other languages like Python and Ruby have static analyzers, but I don't have any experience there unfortunately.
- people always say that CPAN has some really good modules.
A short list:
    - CSV ([Text::CSV](https://metacpan.org/pod/Text::CSV))
    - JSON ([JSON](https://metacpan.org/pod/JSON))[^2]
    - scripting subprocesses ([IPC::Run](https://metacpan.org/pod/IPC::Run), [Capture::Tiny](https://metacpan.org/pod/Capture::Tiny)).
    Comparable to Ruby's [Open3](https://docs.ruby-lang.org/en/master/Open3.html) gem
    - terminal input ([IO::Prompter](https://metacpan.org/pod/IO::Prompter))

[^2]: in fact, JSON datatypes map to the Perl primitives very smoothly
- the backwards compatibility is superb.
Like Windows, backwards compatibility has long been a high priority for Perl,
and people will argue about the merits or demerits, but when something works (well), it's nice when it stays that way.
- I have to toss in everyone's favorite: *Perl regex*.
Regexes are almost never the right tool, but as a hack, they're almost always almost enough.[^3]

[^3]: the most egregious thing I've ever seen was-- and I won't name names-- a perl script that git diff 'd two latex files and inserted color commands for a colored pdf diff (as in the output was a pdf of the common parent, with colored strikeouts and insertions). As you might guess, the "parser" was a bunch of regex. It mostly worked.

### the bad
- the parallelism story is… sad.
The only choice seems to be fork ([Parallel::ForkManager](https://metacpan.org/pod/Parallel::ForkManager)).
[Perl threads](https://metacpan.org/pod/Parallel::ForkManager) (see `man perlthrtut`) are "discouraged", and there doesn't seem to be much on CPAN.
For [Gradescope-Utils](https://github.com/eecs490/gradescope-utils), I ended up turning to [Ruby](#parallel).
In any case, this is probably a good thing.
Who in their right mind is writing a concurrent/parallel perl script?

### the ugly
- every now and then, the omission or inclusion of (parentheses) changes the parse in an unexpected ways.
You eventually get used to it, but the error messages are hard to understand w/o experience.
Not as spammy as C++ stl errors[^1], but at the same level of wtf.

[^1]: Michigan put everyone through the C++ wringer for the first couple years…. I spent every semester waiting for c++2a (now c++20)

### profiling
Now, I have to say that if you find yourself trying to profile a perl script,
you've made a wrong turn in life.
That said, having gone through the experience myself, some notes:

- it seems like the standard profiler is [NYTProf](https://metacpan.org/pod/Devel::NYTProf) (apparently, some folks at the Times banged it up)
- you may need to install w/ `cpanm Devel::NYTProf`
- standard invocation is `perl -d:NYTProf script.pl`
- `nytprofhtml` generates some html to nytprof/ (or `nytprofhtml -o dir/`)
- open it in your browser.
Here's some [sample output](/assets/nytprof/index.html).

That is, NYTProf is *very* good.
And the above sample is "real".
Yes, I had to wait 14 hours for one of the Gradescope-Utils scripts to finish on some student data I had to upload.

**Exercise:** what in the world is that script doing?

## Ruby
### rbenv, bundler, solargraph, and the seven dwarves
Ruby has so many tools I often forget what I'm supposed to use.
Here's what I've been doing:
- `rbenv` to manage ruby versions, and set local versions. Seems to work well. Think `ghcup`, but with local versions as well. And no TUI that segfaults every three seconds.
    - `jruby` can't use native gems, but otherwise seems to work quite well.
    That said, I haven't gotten a change to really use it since I seem to keep needing native gems.
- `bundler` to manager per project gem dependencies. Think `cabal`[^4].
    - and `bundler config set --local path 'vendor/bundle'`. From the Jekyll documentation.
    - and call everything with `bundler exec cmd`, to run `cmd` in the bundler ENV.
- `solargraph` is the language server. Think HLS (ie `haskell-language-server-wrapper`).
    - at least I've been `bundler add solargraph` to the local directory,
    and `bundler exec solargraph stdio` for the language server.
    Could mess around with global installs.
- TODO: `yard` is the documentation generator?
    - `solargraph` needs `yard gems` or `bundler exec yard gems`? Whenever you add gems?

[^4]: v2, if that matters

### [parallel](https://github.com/grosser/parallel)
Parallel map. Works well. 'nuff said.

Everyone needs parallel map.

### JRuby
TODO:
`jrubyc` might actually work?

- download the JRuby Complete .jar from the downloads page
- `jrubyc` produces a .class file
- `java` the .class file with the Complete .jar in the class path

---

[](https://github.com/grosser/parallel)

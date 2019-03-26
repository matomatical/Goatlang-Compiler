# COMP90045Assignment

## Members

| Name                      | Username   | Email                            |
| ------------------------- | ---------- | -------------------------------- |
| Matthew Farrugia-Roberts  | farrugiam  | farrugiam@student.unimelb.edu.au |
| Dongge Liu                | donggel    | donggel@student.unimelb.edu.au   |
| Mariam Shahid             | mariams    | mariams@student.unimelb.edu.au   |
| David Stern               | dibstern   | dstern@student.unimelb.edu.au    |
| Alan Ung                  | alanu      | alanu@student.unimelb.edu.au     |

## Project structure

Here's a map (:: (a -> b) -> [a] -> [b]) of the repository:

```
COMP90045Assignment/
├── README.md                       # <-- YOU ARE HERE
├── Members.txt                     # list of well-chosen team members
├── code/                           # code, organised by project stage:
│   ├── kid/...                       # provided starter code
│   └── stage1/                       # STAGE 1 CODE
│       ├── Goat.cabal, Setup.hs        # This is a cabal project (see below)
│       └── src/                        # code goes in here:
│           ├── Goat.hs                   # parser and pretty-printer
|           ├── ...                       # (we may need to create more files)
│           └── Makefile                  # submission requires a Makefile
└── spec/...                        # project specifications
```

### Building

Development can be done with cabal:

* `cabal build` compiles source code and places executable in (ignored) directory `dist/`.
* `cabal run -- <arguments>` runs `Goat` executable with command-line arguments `<arguments>`.
* `cabal repl` fires up GHCi.
* `cabal help` for more.

### Testing

TODO!

* Set up test framework
    * HUnit?
    * Automatically running tests with `cabal test`?


## Stage 1 - Goat parser and pretty-printer

### Timeline

#### Planning & Preparation Week: Tuesday 26th - Tuesday 2nd

- [ ] Understand Theory (LL, LR)
- [ ] Understand Parsec
- [ ] Break up work into smaller subtasks, planning the implementation week
- [ ] Review Kid Parser
- [ ] Plan Paired Programming
- [ ] Ask Harald Clarifying Questions

#### Implementation Week: Tuesday 2nd-Tuesday 9th

- [ ] Start and Finish 95% of the work
- [ ] Tuesday 9th Meeting: Decide on next steps, how to finish it off 

#### Review Week: Tuesday 9th-Monday 15th

- [ ] Complete any tasks assigned on Tuesday 9th
- [ ] Review Submission





## Stage 3 - Goat compiler

(Specification to be released around Easter/mid-semester break...)

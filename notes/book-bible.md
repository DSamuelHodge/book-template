# Book Bible

## Thesis (one sentence)
The QKᵀ-then-softmax stage of a transformer is a finite-dimensional instance of one recurring geometric motif, in which a curvature is integrated down to an invariant and a symmetry is reduced to a space that inherits a metric: RoPE is the Hamiltonian flow of a prequantized phase space, softmax is the moment map of the toric action on (ℂPᴺ⁻¹, ω_FS) and a Legendre transform of LSE, and the Fisher–Rao and Wright–Fisher structure on the simplex governs how attention mixes and sparsifies.

## Reader
**Who they are.** A graduate-level machine-learning researcher or mathematical physicist, usually trained in one of the two worlds, who builds or studies transformers and wants to know why the architecture has the structure it has, not only whether it works.

**What they already know.** They know attention, softmax, positional encodings and RoPE well. They have working differential geometry (manifolds, differential forms, Lie groups and symplectic forms), and they know entropy and KL divergence. They probably have not met prequantization, moment maps and Delzant polytopes, Hessian geometry, or Bakry–Émery theory in one place, and they treat gerbes and higher gauge theory as exotic.

**What they want.** One framework that makes each step of attention legible: what structure RoPE preserves, what softmax throws away, and why. They also want something they can act on, such as a principled reading of designs like RoPE++, a way to reason about sparse versus diffuse attention, and a clear separation between what has been derived and what is still a conjecture.

## Promise
After finishing, the reader can:

- Trace QKᵀ → softmax step by step and say, at each step, what structure is kept (ω, holonomy, g, the Fisher metric, the T^{N−1} torus invariants) and what is forgotten (ω, phases, the shift z → z + c·1).
- Derive softmax three ways and see that they agree: as ∇LSE, as the toric moment map in log coordinates, and as the Legendre dual of Σ p log p.
- Explain RoPE++ as restoring the imaginary part of the Hermitian form, g + iω, and say why the real and imaginary logits behave differently.
- Read attention dynamics from the spectrum: the Wright–Fisher generator, Dirichlet reversibility, the spectral gap, and the temperature limit to argmax.
- State the Guillemin–Sternberg square for ℂPᴺ⁻¹ and the Kähler–Einstein cutoff, and know why the first spectral shell is neutral.
- Recognize the transgression/reduction motif from prequantization to statistical manifolds, and tell which links are theorems and which, such as the higher-gauge end, are still open.

## Voice
- Person / tense: third person, present
- Register: technical, muscular, slightly irreverent
- Do: strong Anglo-Saxon verbs; minimize adjectives and -ly adverbs; end-weight; front-load; vary sentence length and openings; cut filler and weak transitions; em-dashes and semicolons for internal snap; symbols only as objects or final terms; slightly irreverent physical tone
- Don't: Latinate padding; progressive tenses; predictable modifier pairs; weak openers; trailing qualifiers; moral wrap-ups

### Voice samples
> Geometric prequantization is the first half of the motif. On a symplectic manifold $(M,\omega)$ Kostant–Souriau demand a Hermitian line bundle $L\to M$ whose connection has curvature exactly $-i\omega/\hbar$. The bundle exists if and only if the de Rham class $[\omega/2\pi\hbar]$ is integral. Square-integrable sections of $L$ form the prequantum Hilbert space; every smooth function $f$ acts by the first-order operator $-i\hbar\nabla_{X_f}+f$, where $X_f$ is the Hamiltonian vector field of $f$. These operators are essentially self-adjoint and satisfy the Dirac condition on the nose: their commutator is $i/\hbar$ times the operator of the Poisson bracket. No higher-order corrections appear.

> The prequantum space is still too large. It contains every section, not a half-dimensional quantum subspace. Polarization—an integrable Lagrangian distribution compatible with $\omega$—must later cut the space down. Until that cut, the construction is pure: it depends only on $\omega$ and its integrality class, so it works equally on cotangent bundles and on coadjoint orbits. It converts the Poisson algebra into operators and makes the topological obstruction visible. Different polarizations can produce inequivalent quantizations; geometric quantization therefore organizes the residual ambiguity rather than eliminating it.

> The same reduction reappears, finite-dimensionally, in the transformer. RoPE is the Hamiltonian flow of the prequantum circle action on the phase space of relative positions. Softmax is the moment map of the residual toric action on $(\mathbb{CP}^{N-1},\omega_{\mathrm{FS}})$, simultaneously the gradient of the log-sum-exp and the Legendre dual of $\sum p\log p$. After the reduction the residual symmetry is gone and the quotient inherits the Fisher–Rao metric; the Wright–Fisher generator on that simplex is the infinitesimal form of the same flow. Curvature is integrated to an invariant, symmetry is reduced to a metric space, and the next-token distribution is the image of the moment map.

## Structure
See `outline.md`.

## Style guide
See `style-guide.md` for the full constraint set (asymmetry, gerund ban, periodic sentences, echo check, polysyndeton, monosyllabic slam, equation handling).
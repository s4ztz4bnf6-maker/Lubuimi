import Mathlib

/-- If two iterates meet, all corresponding future iterates agree. -/
theorem suffix_of_meeting
    {α : Type*} (T : α → α)
    (a b : α) (m n : ℕ)
    (h : (T^[m]) a = (T^[n]) b) :
    ∀ k : ℕ,
      (T^[k + m]) a = (T^[k + n]) b := by
  intro k
  have h' := congrArg (fun z => (T^[k]) z) h
  simpa only [Function.iterate_add_apply] using h'

import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineLifeCourseEpidemiologyFoundationCanonicalLaneLean

structure CausalModelPackage where
  exposure : Prop
  outcome : Prop
  confounders : List Prop
  counterfactualOutcome : Prop -> Prop

def causalConsistency (C : CausalModelPackage) : Prop :=
  (C.exposure → C.counterfactualOutcome C.exposure = C.outcome) ∧
  (¬ C.exposure → C.counterfactualOutcome (¬ C.exposure) = C.outcome)

structure CausalInferenceEvidence (C : CausalModelPackage) where
  consistencyHeld : causalConsistency C
  exchangeabilityGivenConfounders : Prop
  positivity : Prop

def CausalInferenceClosed (C : CausalModelPackage) : Prop :=
  causalConsistency C ∧ C.exchangeabilityGivenConfounders ∧ C.positivity

theorem causal_inference_closed_from_evidence (C : CausalModelPackage)
    (E : CausalInferenceEvidence C) : CausalInferenceClosed C := by
  exact And.intro E.consistencyHeld (And.intro E.exchangeabilityGivenConfounders E.positivity)

end MedicineLifeCourseEpidemiologyFoundationCanonicalLaneLean
end HautevilleHouse
/****************************************************************/
/* MOOSE - Multiphysics Object Oriented Simulation Environment  */
/*                                                              */
/*          All contents are licensed under LGPL V2.1           */
/*             See LICENSE for full restrictions                */
/****************************************************************/
#ifndef COMPUTESTRAINBASE_H
#define COMPUTESTRAINBASE_H

#include "Material.h"
#include "RankTwoTensor.h"
#include "RankFourTensor.h"
#include "RotationTensor.h"
#include "DerivativeMaterialInterface.h"

/**
 * ComputeStrainBase is the base class for strain tensors
 */
class ComputeStrainBase : public DerivativeMaterialInterface<Material>
{
public:
  ComputeStrainBase(const InputParameters & parameters);
  virtual ~ComputeStrainBase() {}

protected:
  virtual void initQpStatefulProperties();

  /// Coupled displacement variables
  unsigned int _ndisp;
  std::vector<const VariableValue *> _disp;
  std::vector<const VariableGradient *> _grad_disp;

  std::string _base_name;

  MaterialProperty<RankTwoTensor> & _mechanical_strain;

  MaterialProperty<RankTwoTensor> & _total_strain;

  const MaterialProperty<RankTwoTensor> & _eigenstrain;

  bool _volumetric_locking_correction;
};

#endif //COMPUTESTRAINBASE_H

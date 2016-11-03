/****************************************************************/
/* MOOSE - Multiphysics Object Oriented Simulation Environment  */
/*                                                              */
/*          All contents are licensed under LGPL V2.1           */
/*             See LICENSE for full restrictions                */
/****************************************************************/
#ifndef SOLIDMECH_H
#define SOLIDMECH_H

#include "Kernel.h"
#include "Material.h"

//libMesh includes
#include "libmesh/tensor_value.h"
#include "libmesh/vector_value.h"

//Forward Declarations
class SolidMech;

template<>
InputParameters validParams<SolidMech>();

class SolidMech : public Kernel
{
public:

  SolidMech(const InputParameters & parameters);

  virtual void subdomainSetup();

  void recomputeConstants();

protected:
  Real _E;
  Real _nu;
  Real _c1;
  Real _c2;
  Real _c3;

  TensorValue<Number> _B11;
  TensorValue<Number> _B12;
  TensorValue<Number> _B13;
  TensorValue<Number> _B21;
  TensorValue<Number> _B22;
  TensorValue<Number> _B23;
  TensorValue<Number> _B31;
  TensorValue<Number> _B32;
  TensorValue<Number> _B33;

  VectorValue<Number> _stress;
  TensorValue<Number> _strain;

  Real _density;

  const MaterialProperty<Real> & _E_prop;
  const MaterialProperty<Real> & _nu_prop;

  bool _constant_properties;
};


#endif //SOLIDMECH_H

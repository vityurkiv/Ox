/****************************************************************/
/*               DO NOT MODIFY THIS HEADER                      */
/* MOOSE - Multiphysics Object Oriented Simulation Environment  */
/*                                                              */
/*           (c) 2010 Battelle Energy Alliance, LLC             */
/*                   ALL RIGHTS RESERVED                        */
/*                                                              */
/*          Prepared by Battelle Energy Alliance, LLC           */
/*            Under Contract No. DE-AC07-05ID14517              */
/*            With the U. S. Department of Energy               */
/*                                                              */
/*            See COPYRIGHT for full restrictions               */
/****************************************************************/

#ifndef SPLIT_H
#define SPLIT_H

// MOOSE includes
#include "Restartable.h"
#include "MooseObject.h"
#include "PetscSupport.h"

// Forward declarations
class FEProblem;

/**
 * Base class for split-based preconditioners.
 */
class Split :
  public MooseObject,
  public Restartable
{
 public:
  Split(const InputParameters & parameters);
  virtual ~Split() = default;

  virtual void setup(const std::string& prefix = "-");

#if defined(LIBMESH_HAVE_PETSC) && !PETSC_VERSION_LESS_THAN(3,3,0)
 protected:
  /// Which splitting to use
  enum SplittingType {
    SplittingTypeAdditive,
    SplittingTypeMultiplicative,
    SplittingTypeSymmetricMultiplicative,
    SplittingTypeSchur
  };

  FEProblem& _fe_problem;

  /// "Variables Split operates on
  std::vector<NonlinearVariableName> _vars;

  ///@{
  /// Block and bounrdary restrictions for the split
  std::vector<SubdomainName> _blocks;
  std::vector<BoundaryName> _sides;
  std::vector<BoundaryName> _unsides;
  ///@}

  /// Split subsystem list
  std::vector<std::string> _splitting;

  ///@{
  /// Splitting type and (in case of Schur split) options
  MooseEnum _splitting_type;
  MooseEnum _schur_type;
  MooseEnum _schur_pre;
  MooseEnum _schur_ainv;
  ///@}

  /// Additional PETSc options
  Moose::PetscSupport::PetscOptions  _petsc_options;

#endif // defined(LIBMESH_HAVE_PETSC) && !PETSC_VERSION_LESS_THAN(3,3,0)
};


#endif /* SPLIT_H */

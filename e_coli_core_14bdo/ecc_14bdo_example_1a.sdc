{"model_id": "e_coli_core", "sd_modules": [{"module_type": "protect", "inner_objective": null, "inner_opt_sense": "maximize", "constraints": [[{"BIOMASS_Ecoli_core_w_GAM": 1.0}, ">=", 0.2]], "skip_checks": null, "outer_opt_sense": null, "prod_id": null, "min_gcp": null, "outer_objective": null}, {"module_type": "suppress", "inner_objective": null, "inner_opt_sense": "maximize", "constraints": [[{"EX_14bdo_e": 1.0, "EX_glc__D_e": 0.3}, "<=", 0.0]], "skip_checks": null, "outer_opt_sense": null, "prod_id": null, "min_gcp": null, "outer_objective": null}], "gene_kos": false, "use_scenario": false, "max_solutions": "1", "max_cost": "30", "time_limit": "300", "advanced": false, "solver": "gurobi", "solution_approach": "any"}
function [] = RUN_ALL_TESTS
  %%Note: I have my tests set up this way as it is clearer to work with.
  %%Each test is rather long, so it is easier to keep them in seperate files.

  tests = {'GRAVITATING_BODIES_test_A_due_to_Earth',...
	   'GRAVITATING_BODIES_test_larger_G',...
	   'GRAVITATING_BODIES_test_next_states_simple',...
	   'GRAVITATING_BODIES_test_orbiting',...
     'minAPPROACHtest'...
     'Distance3d_test'...
	};
  for t=tests
    try
      feval(t{:});
    catch lasterror
      fprintf('Failed "%s" with message:\n', t{:});
      fprintf('\t%s\n\n', lasterror.message);
    end
  end
end


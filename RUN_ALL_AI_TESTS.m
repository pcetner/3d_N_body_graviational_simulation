function [] = RUN_ALL_AI_TESTS
  %%Note: I have my tests set up this way as it is clearer to work with.
  %%Each test is rather long, so it is easier to keep them in seperate files.

  tests = {'AI_TEST_KE_1',...
	   'Distance3d_test_AI_1',...
	   'Distance3d_test_AI_2',...
	   'Distance3d_test_AI_3',...
     'Distance3d_test_AI_4',...
     'min_approach_distance_test_AI_1',...
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


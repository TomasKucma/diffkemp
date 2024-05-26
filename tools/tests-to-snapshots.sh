for test in tests/regression/kernel_modules/*; do
    test_name=$(basename ${test})
    echo "Running $test_name"
    echo ${test_name} > fn_list.txt
    bin/diffkemp llvm-to-snapshot ${test} ${test_name}_new.ll snapshots/${test_name}.new fn_list.tmp
    bin/diffkemp llvm-to-snapshot ${test} ${test_name}_old.ll snapshots/${test_name}.old fn_list.tmp
done

rm fn_list.tmp

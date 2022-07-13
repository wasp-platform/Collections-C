(module
  (type (;0;) (func (param i32 i32) (result i32)))
  (type (;1;) (func (param i32)))
  (type (;2;) (func (param i32) (result i32)))
  (type (;3;) (func))
  (type (;4;) (func (result i32)))
  (type (;5;) (func (param i32 i32)))
  (func $pred1 (type 2) (param i32) (result i32)
    (local i32)
    global.get 0
    i32.const 16
    i32.sub
    local.tee 1
    local.get 0
    i32.store offset=12
    local.get 1
    i32.load offset=12
    i32.load
    i32.const 0
    i32.eq
    i32.const 1
    i32.and)
  (func $setup_tests (type 3)
    (local i32)
    global.get 0
    i32.const 16
    i32.sub
    local.tee 0
    global.set 0
    i32.const 1044
    call $list_new
    drop
    i32.const 1048
    call $list_new
    drop
    i32.const 0
    i32.const 1024
    i32.symbolic
    i32.store offset=1052
    i32.const 0
    i32.const 1026
    i32.symbolic
    i32.store offset=1056
    i32.const 0
    i32.const 1028
    i32.symbolic
    i32.store offset=1060
    i32.const 0
    i32.const 1030
    i32.symbolic
    i32.store offset=1064
    i32.const 0
    i32.const 1032
    i32.symbolic
    i32.store offset=1068
    i32.const 0
    i32.const 1034
    i32.symbolic
    i32.store offset=1072
    i32.const 0
    i32.const 1036
    i32.symbolic
    i32.store offset=1076
    i32.const 0
    i32.const 1038
    i32.symbolic
    i32.store offset=1080
    local.get 0
    i32.const 4
    call $malloc
    i32.store offset=12
    local.get 0
    i32.const 4
    call $malloc
    i32.store offset=8
    local.get 0
    i32.const 4
    call $malloc
    i32.store offset=4
    local.get 0
    i32.const 4
    call $malloc
    i32.store
    local.get 0
    i32.load offset=12
    i32.const 0
    i32.load offset=1052
    i32.store
    local.get 0
    i32.load offset=8
    i32.const 0
    i32.load offset=1056
    i32.store
    local.get 0
    i32.load offset=4
    i32.const 0
    i32.load offset=1060
    i32.store
    local.get 0
    i32.load
    i32.const 0
    i32.load offset=1064
    i32.store
    i32.const 0
    i32.load offset=1044
    local.get 0
    i32.load offset=12
    call $list_add
    drop
    i32.const 0
    i32.load offset=1044
    local.get 0
    i32.load offset=8
    call $list_add
    drop
    i32.const 0
    i32.load offset=1044
    local.get 0
    i32.load offset=4
    call $list_add
    drop
    i32.const 0
    i32.load offset=1044
    local.get 0
    i32.load
    call $list_add
    drop
    local.get 0
    i32.const 4
    call $malloc
    i32.store offset=12
    local.get 0
    i32.const 4
    call $malloc
    i32.store offset=8
    local.get 0
    i32.const 4
    call $malloc
    i32.store offset=4
    local.get 0
    i32.const 4
    call $malloc
    i32.store
    local.get 0
    i32.load offset=12
    i32.const 0
    i32.load offset=1068
    i32.store
    local.get 0
    i32.load offset=8
    i32.const 0
    i32.load offset=1072
    i32.store
    local.get 0
    i32.load offset=4
    i32.const 0
    i32.load offset=1076
    i32.store
    local.get 0
    i32.load
    i32.const 0
    i32.load offset=1080
    i32.store
    i32.const 0
    i32.load offset=1048
    local.get 0
    i32.load offset=12
    call $list_add
    drop
    i32.const 0
    i32.load offset=1048
    local.get 0
    i32.load offset=8
    call $list_add
    drop
    i32.const 0
    i32.load offset=1048
    local.get 0
    i32.load offset=4
    call $list_add
    drop
    i32.const 0
    i32.load offset=1048
    local.get 0
    i32.load
    call $list_add
    drop
    local.get 0
    i32.const 16
    i32.add
    global.set 0)
  (func $teardown_test (type 3)
    i32.const 0
    i32.load offset=1044
    i32.const 1
    call $list_destroy_cb
    i32.const 0
    i32.load offset=1048
    call $list_destroy)
  (func $__original_main (type 4) (result i32)
    (local i32 i32)
    global.get 0
    i32.const 16
    i32.sub
    local.tee 0
    global.set 0
    i32.const 0
    local.set 1
    local.get 0
    i32.const 0
    i32.store offset=12
    call $setup_tests
    block  ;; label = @1
      i32.const 0
      i32.load offset=1052
      i32.eqz
      br_if 0 (;@1;)
      i32.const 0
      local.set 1
      i32.const 0
      i32.load offset=1056
      i32.eqz
      br_if 0 (;@1;)
      i32.const 0
      local.set 1
      i32.const 0
      i32.load offset=1060
      i32.eqz
      br_if 0 (;@1;)
      i32.const 0
      i32.load offset=1064
      i32.const 0
      i32.ne
      local.set 1
    end
    local.get 1
    i32.const 1
    i32.and
    sym_assume
    i32.const 4
    i32.const 0
    i32.load offset=1044
    call $list_size
    i32.eq
    i32.const 1
    i32.and
    sym_assert
    i32.const 0
    i32.load offset=1044
    i32.const 2
    call $list_filter_mut
    drop
    i32.const 0
    i32.const 0
    i32.load offset=1044
    call $list_size
    i32.eq
    i32.const 1
    i32.and
    sym_assert
    local.get 0
    i32.const 0
    i32.store offset=8
    i32.const 0
    i32.load offset=1044
    local.get 0
    i32.const 8
    i32.add
    local.tee 1
    call $list_get_first
    drop
    local.get 0
    i32.load offset=8
    i32.const 0
    i32.eq
    i32.const 1
    i32.and
    sym_assert
    i32.const 0
    i32.load offset=1044
    local.get 1
    call $list_get_last
    drop
    local.get 0
    i32.load offset=8
    i32.const 0
    i32.eq
    i32.const 1
    i32.and
    sym_assert
    call $teardown_test
    local.get 0
    i32.load offset=12
    local.set 1
    local.get 0
    i32.const 16
    i32.add
    global.set 0
    local.get 1)
  (func $malloc (type 2) (param i32) (result i32)
    (local i32)
    global.get 0
    i32.const 16
    i32.sub
    local.tee 1
    global.set 0
    local.get 1
    local.get 0
    i32.store offset=12
    local.get 1
    i32.const 0
    i32.load offset=1040
    i32.store offset=8
    local.get 1
    i32.const 0
    i32.store offset=4
    block  ;; label = @1
      loop  ;; label = @2
        local.get 1
        i32.load offset=4
        local.get 1
        i32.load offset=12
        i32.lt_u
        i32.const 1
        i32.and
        i32.eqz
        br_if 1 (;@1;)
        i32.const 0
        i32.load offset=1040
        local.get 1
        i32.load offset=4
        i32.add
        i32.const 105
        i32.store8
        local.get 1
        local.get 1
        i32.load offset=4
        i32.const 1
        i32.add
        i32.store offset=4
        br 0 (;@2;)
      end
    end
    i32.const 0
    i32.const 0
    i32.load offset=1040
    local.get 1
    i32.load offset=12
    i32.add
    i32.store offset=1040
    local.get 1
    i32.load offset=8
    local.get 1
    i32.load offset=12
    alloc
    local.set 0
    local.get 1
    i32.const 16
    i32.add
    global.set 0
    local.get 0)
  (func $calloc (type 0) (param i32 i32) (result i32)
    (local i32)
    global.get 0
    i32.const 16
    i32.sub
    local.tee 2
    global.set 0
    local.get 2
    local.get 0
    i32.store offset=12
    local.get 2
    local.get 1
    i32.store offset=8
    local.get 2
    i32.const 0
    i32.load offset=1040
    i32.store offset=4
    local.get 2
    i32.const 0
    i32.store
    block  ;; label = @1
      loop  ;; label = @2
        local.get 2
        i32.load
        local.get 2
        i32.load offset=12
        local.get 2
        i32.load offset=8
        i32.mul
        i32.lt_u
        i32.const 1
        i32.and
        i32.eqz
        br_if 1 (;@1;)
        i32.const 0
        i32.load offset=1040
        local.get 2
        i32.load
        i32.add
        i32.const 0
        i32.store8
        local.get 2
        local.get 2
        i32.load
        i32.const 1
        i32.add
        i32.store
        br 0 (;@2;)
      end
    end
    i32.const 0
    i32.const 0
    i32.load offset=1040
    local.get 2
    i32.load offset=12
    local.get 2
    i32.load offset=8
    i32.mul
    i32.add
    i32.store offset=1040
    local.get 2
    i32.load offset=4
    local.get 2
    i32.load offset=12
    local.get 2
    i32.load offset=8
    i32.mul
    alloc
    local.set 1
    local.get 2
    i32.const 16
    i32.add
    global.set 0
    local.get 1)
  (func $free (type 1) (param i32)
    (local i32)
    global.get 0
    i32.const 16
    i32.sub
    local.tee 1
    global.set 0
    local.get 1
    local.get 0
    i32.store offset=12
    local.get 1
    i32.load offset=12
    free
    local.get 1
    i32.const 16
    i32.add
    global.set 0)
  (func $list_conf_init (type 1) (param i32)
    (local i32)
    global.get 0
    i32.const 16
    i32.sub
    local.tee 1
    local.get 0
    i32.store offset=12
    local.get 1
    i32.load offset=12
    i32.const 3
    i32.store
    local.get 1
    i32.load offset=12
    i32.const 4
    i32.store offset=4
    local.get 1
    i32.load offset=12
    i32.const 1
    i32.store offset=8)
  (func $list_new (type 2) (param i32) (result i32)
    (local i32)
    global.get 0
    i32.const 16
    i32.sub
    local.tee 1
    global.set 0
    local.get 1
    local.get 0
    i32.store offset=12
    local.get 1
    local.tee 0
    call $list_conf_init
    local.get 0
    local.get 1
    i32.load offset=12
    call $list_new_conf
    local.set 0
    local.get 1
    i32.const 16
    i32.add
    global.set 0
    local.get 0)
  (func $list_new_conf (type 0) (param i32 i32) (result i32)
    (local i32)
    global.get 0
    i32.const 16
    i32.sub
    local.tee 2
    global.set 0
    local.get 2
    local.get 0
    i32.store offset=8
    local.get 2
    local.get 1
    i32.store offset=4
    local.get 2
    i32.const 1
    i32.const 24
    local.get 2
    i32.load offset=8
    i32.load offset=4
    call_indirect (type 0)
    i32.store
    block  ;; label = @1
      block  ;; label = @2
        local.get 2
        i32.load
        i32.const 0
        i32.ne
        i32.const 1
        i32.and
        br_if 0 (;@2;)
        local.get 2
        i32.const 1
        i32.store offset=12
        br 1 (;@1;)
      end
      local.get 2
      i32.load
      local.get 2
      i32.load offset=8
      i32.load
      i32.store offset=12
      local.get 2
      i32.load
      local.get 2
      i32.load offset=8
      i32.load offset=4
      i32.store offset=16
      local.get 2
      i32.load
      local.get 2
      i32.load offset=8
      i32.load offset=8
      i32.store offset=20
      local.get 2
      i32.load offset=4
      local.get 2
      i32.load
      i32.store
      local.get 2
      i32.const 0
      i32.store offset=12
    end
    local.get 2
    i32.load offset=12
    local.set 1
    local.get 2
    i32.const 16
    i32.add
    global.set 0
    local.get 1)
  (func $list_destroy (type 1) (param i32)
    (local i32)
    global.get 0
    i32.const 16
    i32.sub
    local.tee 1
    global.set 0
    local.get 1
    local.get 0
    i32.store offset=12
    block  ;; label = @1
      local.get 1
      i32.load offset=12
      i32.load
      i32.const 0
      i32.gt_u
      i32.const 1
      i32.and
      i32.eqz
      br_if 0 (;@1;)
      local.get 1
      i32.load offset=12
      call $list_remove_all
      drop
    end
    local.get 1
    i32.load offset=12
    local.get 1
    i32.load offset=12
    i32.load offset=20
    call_indirect (type 1)
    local.get 1
    i32.const 16
    i32.add
    global.set 0)
  (func $list_remove_all (type 2) (param i32) (result i32)
    (local i32)
    global.get 0
    i32.const 16
    i32.sub
    local.tee 1
    global.set 0
    local.get 1
    local.get 0
    i32.store offset=8
    local.get 1
    local.get 1
    i32.load offset=8
    i32.const 0
    call $unlinkn_all
    i32.store offset=4
    block  ;; label = @1
      block  ;; label = @2
        local.get 1
        i32.load offset=4
        i32.eqz
        br_if 0 (;@2;)
        local.get 1
        i32.load offset=8
        i32.const 0
        i32.store offset=4
        local.get 1
        i32.load offset=8
        i32.const 0
        i32.store offset=8
        local.get 1
        i32.const 0
        i32.store offset=12
        br 1 (;@1;)
      end
      local.get 1
      i32.const 7
      i32.store offset=12
    end
    local.get 1
    i32.load offset=12
    local.set 0
    local.get 1
    i32.const 16
    i32.add
    global.set 0
    local.get 0)
  (func $unlinkn_all (type 0) (param i32 i32) (result i32)
    (local i32)
    global.get 0
    i32.const 32
    i32.sub
    local.tee 2
    global.set 0
    local.get 2
    local.get 0
    i32.store offset=24
    local.get 2
    local.get 1
    i32.store offset=20
    block  ;; label = @1
      block  ;; label = @2
        local.get 2
        i32.load offset=24
        i32.load
        br_if 0 (;@2;)
        local.get 2
        i32.const 0
        i32.store offset=28
        br 1 (;@1;)
      end
      local.get 2
      local.get 2
      i32.load offset=24
      i32.load offset=4
      i32.store offset=16
      block  ;; label = @2
        loop  ;; label = @3
          local.get 2
          i32.load offset=16
          i32.const 0
          i32.ne
          i32.const 1
          i32.and
          i32.eqz
          br_if 1 (;@2;)
          local.get 2
          local.get 2
          i32.load offset=16
          i32.load offset=4
          i32.store offset=12
          block  ;; label = @4
            local.get 2
            i32.load offset=20
            i32.const 0
            i32.ne
            i32.const 1
            i32.and
            i32.eqz
            br_if 0 (;@4;)
            local.get 2
            i32.load offset=16
            i32.load
            local.get 2
            i32.load offset=20
            call_indirect (type 1)
          end
          local.get 2
          i32.load offset=24
          local.get 2
          i32.load offset=16
          call $unlinkn
          drop
          local.get 2
          local.get 2
          i32.load offset=12
          i32.store offset=16
          br 0 (;@3;)
        end
      end
      local.get 2
      i32.const 1
      i32.store offset=28
    end
    local.get 2
    i32.load offset=28
    local.set 1
    local.get 2
    i32.const 32
    i32.add
    global.set 0
    local.get 1)
  (func $list_destroy_cb (type 5) (param i32 i32)
    (local i32)
    global.get 0
    i32.const 16
    i32.sub
    local.tee 2
    global.set 0
    local.get 2
    local.get 0
    i32.store offset=12
    local.get 2
    local.get 1
    i32.store offset=8
    local.get 2
    i32.load offset=12
    local.get 2
    i32.load offset=8
    call $list_remove_all_cb
    drop
    local.get 2
    i32.load offset=12
    local.get 2
    i32.load offset=12
    i32.load offset=20
    call_indirect (type 1)
    local.get 2
    i32.const 16
    i32.add
    global.set 0)
  (func $list_remove_all_cb (type 0) (param i32 i32) (result i32)
    (local i32)
    global.get 0
    i32.const 16
    i32.sub
    local.tee 2
    global.set 0
    local.get 2
    local.get 0
    i32.store offset=8
    local.get 2
    local.get 1
    i32.store offset=4
    local.get 2
    local.get 2
    i32.load offset=8
    local.get 2
    i32.load offset=4
    call $unlinkn_all
    i32.store
    block  ;; label = @1
      block  ;; label = @2
        local.get 2
        i32.load
        i32.eqz
        br_if 0 (;@2;)
        local.get 2
        i32.load offset=8
        i32.const 0
        i32.store offset=4
        local.get 2
        i32.load offset=8
        i32.const 0
        i32.store offset=8
        local.get 2
        i32.const 0
        i32.store offset=12
        br 1 (;@1;)
      end
      local.get 2
      i32.const 7
      i32.store offset=12
    end
    local.get 2
    i32.load offset=12
    local.set 1
    local.get 2
    i32.const 16
    i32.add
    global.set 0
    local.get 1)
  (func $list_add (type 0) (param i32 i32) (result i32)
    (local i32)
    global.get 0
    i32.const 16
    i32.sub
    local.tee 2
    global.set 0
    local.get 2
    local.get 0
    i32.store offset=12
    local.get 2
    local.get 1
    i32.store offset=8
    local.get 2
    i32.load offset=12
    local.get 2
    i32.load offset=8
    call $list_add_last
    local.set 1
    local.get 2
    i32.const 16
    i32.add
    global.set 0
    local.get 1)
  (func $list_add_last (type 0) (param i32 i32) (result i32)
    (local i32)
    global.get 0
    i32.const 16
    i32.sub
    local.tee 2
    global.set 0
    local.get 2
    local.get 0
    i32.store offset=8
    local.get 2
    local.get 1
    i32.store offset=4
    local.get 2
    i32.const 1
    i32.const 12
    local.get 2
    i32.load offset=8
    i32.load offset=16
    call_indirect (type 0)
    i32.store
    block  ;; label = @1
      block  ;; label = @2
        local.get 2
        i32.load
        i32.const 0
        i32.eq
        i32.const 1
        i32.and
        i32.eqz
        br_if 0 (;@2;)
        local.get 2
        i32.const 1
        i32.store offset=12
        br 1 (;@1;)
      end
      local.get 2
      i32.load
      local.get 2
      i32.load offset=4
      i32.store
      block  ;; label = @2
        block  ;; label = @3
          local.get 2
          i32.load offset=8
          i32.load
          br_if 0 (;@3;)
          local.get 2
          i32.load offset=8
          local.get 2
          i32.load
          i32.store offset=4
          local.get 2
          i32.load offset=8
          local.get 2
          i32.load
          i32.store offset=8
          br 1 (;@2;)
        end
        local.get 2
        i32.load
        local.get 2
        i32.load offset=8
        i32.load offset=8
        i32.store offset=8
        local.get 2
        i32.load offset=8
        i32.load offset=8
        local.get 2
        i32.load
        i32.store offset=4
        local.get 2
        i32.load offset=8
        local.get 2
        i32.load
        i32.store offset=8
      end
      local.get 2
      i32.load offset=8
      local.tee 1
      local.get 1
      i32.load
      i32.const 1
      i32.add
      i32.store
      local.get 2
      i32.const 0
      i32.store offset=12
    end
    local.get 2
    i32.load offset=12
    local.set 1
    local.get 2
    i32.const 16
    i32.add
    global.set 0
    local.get 1)
  (func $unlinkn (type 0) (param i32 i32) (result i32)
    (local i32)
    global.get 0
    i32.const 16
    i32.sub
    local.tee 2
    global.set 0
    local.get 2
    local.get 0
    i32.store offset=12
    local.get 2
    local.get 1
    i32.store offset=8
    local.get 2
    local.get 2
    i32.load offset=8
    i32.load
    i32.store offset=4
    block  ;; label = @1
      local.get 2
      i32.load offset=8
      i32.load offset=8
      i32.const 0
      i32.ne
      i32.const 1
      i32.and
      i32.eqz
      br_if 0 (;@1;)
      local.get 2
      i32.load offset=8
      i32.load offset=8
      local.get 2
      i32.load offset=8
      i32.load offset=4
      i32.store offset=4
    end
    block  ;; label = @1
      local.get 2
      i32.load offset=8
      i32.load offset=8
      i32.const 0
      i32.eq
      i32.const 1
      i32.and
      i32.eqz
      br_if 0 (;@1;)
      local.get 2
      i32.load offset=12
      local.get 2
      i32.load offset=8
      i32.load offset=4
      i32.store offset=4
    end
    block  ;; label = @1
      local.get 2
      i32.load offset=8
      i32.load offset=4
      i32.const 0
      i32.eq
      i32.const 1
      i32.and
      i32.eqz
      br_if 0 (;@1;)
      local.get 2
      i32.load offset=12
      local.get 2
      i32.load offset=8
      i32.load offset=8
      i32.store offset=8
    end
    block  ;; label = @1
      local.get 2
      i32.load offset=8
      i32.load offset=4
      i32.const 0
      i32.ne
      i32.const 1
      i32.and
      i32.eqz
      br_if 0 (;@1;)
      local.get 2
      i32.load offset=8
      i32.load offset=4
      local.get 2
      i32.load offset=8
      i32.load offset=8
      i32.store offset=8
    end
    local.get 2
    i32.load offset=8
    local.get 2
    i32.load offset=12
    i32.load offset=20
    call_indirect (type 1)
    local.get 2
    i32.load offset=12
    local.tee 1
    local.get 1
    i32.load
    i32.const -1
    i32.add
    i32.store
    local.get 2
    i32.load offset=4
    local.set 1
    local.get 2
    i32.const 16
    i32.add
    global.set 0
    local.get 1)
  (func $list_get_first (type 0) (param i32 i32) (result i32)
    (local i32)
    global.get 0
    i32.const 16
    i32.sub
    local.tee 2
    local.get 0
    i32.store offset=8
    local.get 2
    local.get 1
    i32.store offset=4
    block  ;; label = @1
      block  ;; label = @2
        local.get 2
        i32.load offset=8
        i32.load
        br_if 0 (;@2;)
        local.get 2
        i32.const 7
        i32.store offset=12
        br 1 (;@1;)
      end
      local.get 2
      i32.load offset=4
      local.get 2
      i32.load offset=8
      i32.load offset=4
      i32.load
      i32.store
      local.get 2
      i32.const 0
      i32.store offset=12
    end
    local.get 2
    i32.load offset=12)
  (func $list_get_last (type 0) (param i32 i32) (result i32)
    (local i32)
    global.get 0
    i32.const 16
    i32.sub
    local.tee 2
    local.get 0
    i32.store offset=8
    local.get 2
    local.get 1
    i32.store offset=4
    block  ;; label = @1
      block  ;; label = @2
        local.get 2
        i32.load offset=8
        i32.load
        br_if 0 (;@2;)
        local.get 2
        i32.const 7
        i32.store offset=12
        br 1 (;@1;)
      end
      local.get 2
      i32.load offset=4
      local.get 2
      i32.load offset=8
      i32.load offset=8
      i32.load
      i32.store
      local.get 2
      i32.const 0
      i32.store offset=12
    end
    local.get 2
    i32.load offset=12)
  (func $list_size (type 2) (param i32) (result i32)
    (local i32)
    global.get 0
    i32.const 16
    i32.sub
    local.tee 1
    local.get 0
    i32.store offset=12
    local.get 1
    i32.load offset=12
    i32.load)
  (func $list_filter_mut (type 0) (param i32 i32) (result i32)
    (local i32)
    global.get 0
    i32.const 32
    i32.sub
    local.tee 2
    global.set 0
    local.get 2
    local.get 0
    i32.store offset=24
    local.get 2
    local.get 1
    i32.store offset=20
    block  ;; label = @1
      block  ;; label = @2
        local.get 2
        i32.load offset=24
        call $list_size
        br_if 0 (;@2;)
        local.get 2
        i32.const 8
        i32.store offset=28
        br 1 (;@1;)
      end
      local.get 2
      local.get 2
      i32.load offset=24
      i32.load offset=4
      i32.store offset=16
      local.get 2
      i32.const 0
      i32.store offset=12
      block  ;; label = @2
        loop  ;; label = @3
          local.get 2
          i32.load offset=16
          i32.const 0
          i32.ne
          i32.const 1
          i32.and
          i32.eqz
          br_if 1 (;@2;)
          local.get 2
          local.get 2
          i32.load offset=16
          i32.load offset=4
          i32.store offset=12
          block  ;; label = @4
            local.get 2
            i32.load offset=16
            i32.load
            local.get 2
            i32.load offset=20
            call_indirect (type 2)
            br_if 0 (;@4;)
            local.get 2
            i32.load offset=24
            local.get 2
            i32.load offset=16
            call $unlinkn
            drop
          end
          local.get 2
          local.get 2
          i32.load offset=12
          i32.store offset=16
          br 0 (;@3;)
        end
      end
      local.get 2
      i32.const 0
      i32.store offset=28
    end
    local.get 2
    i32.load offset=28
    local.set 1
    local.get 2
    i32.const 32
    i32.add
    global.set 0
    local.get 1)
  (func $assume (type 1) (param i32)
    global.get 0
    i32.const 16
    i32.sub
    local.get 0
    i32.store offset=12)
  (func $assert (type 1) (param i32)
    global.get 0
    i32.const 16
    i32.sub
    local.get 0
    i32.store offset=12)
  (func $alloc (type 0) (param i32 i32) (result i32)
    (local i32)
    global.get 0
    i32.const 16
    i32.sub
    local.tee 2
    local.get 0
    i32.store offset=12
    local.get 2
    local.get 1
    i32.store offset=8
    local.get 2
    i32.load offset=12)
  (func $dealloc (type 1) (param i32)
    global.get 0
    i32.const 16
    i32.sub
    local.get 0
    i32.store offset=12)
  (func $sym_int (type 2) (param i32) (result i32)
    (local i32)
    global.get 0
    i32.const 16
    i32.sub
    local.tee 1
    local.get 0
    i32.store offset=12
    local.get 1
    i32.load offset=12)
  (table (;0;) 5 5 funcref)
  (memory (;0;) 2)
  (global (;0;) (mut i32) (i32.const 66624))
  (export "memory" (memory 0))
  (export "__original_main" (func $__original_main))
  (elem (;0;) (i32.const 1) $free $pred1 $malloc $calloc)
  (data (;0;) (i32.const 1024) "a\00b\00c\00d\00e\00f\00g\00h\00")
  (data (;1;) (i32.const 1040) "@\04\01\00"))
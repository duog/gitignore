{ pkgs ? import <nixpkgs> {} }:

let
  testdata = import ./testdata.nix { inherit pkgs; };
  runner = import ./runner.nix { inherit pkgs; };
in
{
  plain = runner.makeTest { name = "plain"; rootDir = testdata.sourceUnfiltered + "/test-tree"; };
  nested = runner.makeTest { name = "nested"; rootDir = testdata.sourceUnfilteredRecursive + "/test-tree"; };

  plain-with-testdata-dir = runner.makeTest { name = "plain"; rootDir = testdata.sourceUnfiltered; };
  nested-with-testdata-dir = runner.makeTest { name = "nested"; rootDir = testdata.sourceUnfilteredRecursive; };
  
  plain-with-testdata-subdir = runner.makeTest { name = "plain"; rootDir = testdata.sourceUnfiltered; subpath = "test-tree"; };
  nested-with-testdata-subdir = runner.makeTest { name = "nested"; rootDir = testdata.sourceUnfilteredRecursive; subpath = "test-tree"; };
  
  subdir-1 = runner.makeTest { name = "subdir-1"; rootDir = testdata.sourceUnfiltered + "/test-tree"; subpath = "1-simpl"; };
  subdir-1x = runner.makeTest { name = "subdir-1x"; rootDir = testdata.sourceUnfiltered + "/test-tree"; subpath = "1-xxxxx"; };
  subdir-2 = runner.makeTest { name = "subdir-2"; rootDir = testdata.sourceUnfiltered + "/test-tree"; subpath = "2-negation"; };
  subdir-3 = runner.makeTest { name = "subdir-3"; rootDir = testdata.sourceUnfiltered + "/test-tree"; subpath = "3-wildcards"; };
  subdir-4 = runner.makeTest { name = "subdir-4"; rootDir = testdata.sourceUnfiltered + "/test-tree"; subpath = "4-escapes"; };
  subdir-9 = runner.makeTest { name = "subdir-9"; rootDir = testdata.sourceUnfiltered + "/test-tree"; subpath = "9-expected"; };

}
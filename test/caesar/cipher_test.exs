defmodule Caesar.CipherTest do
  use ExUnit.Case
  doctest Caesar.Cipher

  import Caesar.Cipher

  test "encrypt shift cypher mapping" do
    assert encrypt("abcd", 1) == "zabc"
  end

  test "encrpyts capital letters" do
    assert encrypt("abCD", 1) == "zaBC"
  end

  test "encrypt handles spaces" do
    assert encrypt("ab cd", 1) == "za bc"
  end

  test "encrypt handles large shift" do
    assert encrypt("abcd", 27) == "zabc"
  end
end

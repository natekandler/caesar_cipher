defmodule Caesar.Cipher do
  def encrypt(msg, shift) do
    msg
      |> to_char_list
      |> Enum.map(&shift_char(&1, shift))
      |> List.to_string
  end

  defp shift_char(char, shift) do
    case char do
      chr when chr in (?a..?z) -> calculate_mapping(?a, chr, shift)
      chr when chr in (?A..?Z) -> calculate_mapping(?A, chr, shift)
      chr -> chr
    end
  end

  defp calculate_mapping(base_letter, char, shift) do
    #find the ASCII integer of the character and normalize it
    #by subtracting the size of the alphabet
    normalize = &(&1 - 26)
    #ensure shift number is within alphabet size
    shift_num = rem(shift, 26)
    #calculate the shifted value
    base_letter + rem(char - normalize.(base_letter) - shift_num, 26)
  end

end

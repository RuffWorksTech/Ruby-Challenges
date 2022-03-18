=begin
----------------------------PROMPT----------------------------------
Write a program that can calculate the Hamming distance between two DNA strands.

A mutation is simply a mistake that occurs during the creation or copying of a nucleic acid, in particular DNA. Because nucleic acids are vital to cellular functions, mutations tend to cause a ripple effect throughout the cell. Although mutations are technically mistakes, a very rare mutation may equip the cell with a beneficial attribute. In fact, the macro effects of evolution are attributable by the accumulated result of beneficial microscopic mutations over many generations.

The simplest and most common type of nucleic acid mutation is a point mutation, which replaces one base with another at a single nucleotide.

By counting the number of differences between two homologous DNA strands taken from different genomes with a common ancestor, we get a measure of the minimum number of point mutations that could have occurred on the evolutionary path between the two strands.

This is called the Hamming distance.

-----------------------------INPUT----------------------------------
Two strings of equal length consisting of a mix of capital 'A', 'C', 'G', and 'T' characters

----------------------------OUTPUT----------------------------------
Outputs the hammering distance (differences between the two strings)

-----------------------------RULES----------------------------------
Explicit:
- Compute the hammering distance over the shorter array only

Implicit:

-------------------------DATA STRUCTURES----------------------------
Arrays

----------------------------ALGORITHM-------------------------------
Zip up two arrays into one nested array
Create sub-array of arrays with two elements each
Iterate through array
    - Break if any element is `nil`
    - If they are the same, skip the iteration
    - Else, increment a counter += 1
Return counter

=end

class DNA
 def initialize(strand)
   @strand = strand
 end

 def hamming_distance(strand2)
   counter = 0
   @strand.chars.zip(strand2.chars).each do |group|
     break if group.any?(nil)
     counter += 1 if group.uniq.size == 2
   end
   counter
 end
end

# dna1 = DNA.new('ACT')
# p dna1.hamming_distance('GGA') == 3

# dna2 = DNA.new('GGACG')
# p dna2.hamming_distance('GGTCG') == 1

# dna3 = DNA.new('AAACTAGGGG')
# p dna3.hamming_distance('AGGCTAGCGGTAGGAC') == 3

# dna4 = DNA.new('AGACAACAGCCAGCCGCCGGATT')
# p dna4.hamming_distance('AGGCAA') == 1
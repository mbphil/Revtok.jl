using Revtok
using Test
import Base.Unicode: normalize

# write your own tests here
@test begin
    text = replace(normalize(read(
        download("http://www.gutenberg.org/cache/epub/1661/pg1661.txt"), String)[4:end],
        newline2lf=true), r"\n+" => s->length(s) == 1 ? " " : "\n" ^ (length(s) - 1));
    detokenize(tokenize(text)) == text
end

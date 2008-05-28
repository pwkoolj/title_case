import string
small = "a an and as at but by en for if in of on or the to v. via vs. v vs".split()

def title_case(title_string):
    def title(word):
        if (not '.' in word[:-2]) and word[1:].lower() == word[1:]:
            pos = [p for p,c in enumerate(word) if not c in string.punctuation][0]
            return ''.join(c.upper() if p==pos else c for p,c in enumerate(word))
        return word
    
    def titleTest(w, prev):
        if w.lower() in small:
            return title(w) if prev.endswith(':') else w.lower()
        return title(w)

    word_list = title_string.split()
    pos_r = range(1,len(word_list)-1)
    words = [titleTest(word, word_list[pos-1] if pos>0 else '')
             if pos in pos_r else title(word)
             for pos, word in enumerate(word_list)]
    return ' '.join(words)

if __name__ == "__main__":
    assert "Q&A With Steve Jobs: 'That's What Happens in Technology'" == title_case("Q&A With Steve Jobs: 'That's What Happens In Technology'")
    #test_atts_problem
    assert "What Is AT&T's Problem?" == title_case("What Is AT&T's Problem?")
  
    "test_apple_deal_falls_through"
    assert "Apple Deal With AT&T Falls Through" == title_case("Apple Deal With AT&T Falls Through")
  
    "test_this_v_that"
    assert "This v That" == title_case("this v that")
  
    "test_this_vs_that"
    assert "This vs That" == title_case("this vs that")
  
    "test_this_v__that"
    assert "This v. That" == title_case("this v. that")
  
    "test_this_vs__that"
    assert "This vs. That" == title_case("this vs. that")
    
    "test_sec_apple_probe"
    assert "The SEC's Apple Probe: What You Need to Know" == title_case("The SEC's Apple Probe: What You Need to Know")
  
    "test_small_word_at_start_in_quotes"
    assert "'By the Way, Small Word at the Start but Within Quotes.'" == title_case("'by the Way, small word at the start but within quotes.'")
    
    "test_small_word_at_end"
    print title_case("Small word at end is nothing to be afraid of")
    assert "Small Word at End Is Nothing to Be Afraid Of" == title_case("Small word at end is nothing to be afraid of")
  
    "test_sub_phrase_small_word"
    assert "Starting Sub-Phrase With a Small Word: A Trick, Perhaps?" == title_case("Starting Sub-Phrase With a Small Word: a Trick, Perhaps?")
  
    "test_sub_phrase_small_word_single_quotes"
    assert "Sub-Phrase With a Small Word in Quotes: 'A Trick, Perhaps?'" == title_case("Sub-Phrase With a Small Word in Quotes: 'a Trick, Perhaps?'")
  
    "test_sub_phrase_small_word_double_quotes"
    assert 'Sub-Phrase With a Small Word in Quotes: "A Trick, Perhaps?"' == title_case('Sub-Phrase With a Small Word in Quotes: "a Trick, Perhaps?"')
  
    "test_nothing_to_be_afraid_lowercase_of"
    assert '"Nothing to Be Afraid Of?"' == title_case('"Nothing to Be Afraid of?"')
  
    "test_nothing_to_be_afraid_uppercase_of"
    assert '"Nothing to Be Afraid Of?"' == title_case('"Nothing to Be Afraid Of?"')
  
    "test_a_thing"
    assert "A Thing" == title_case("a thing")
  
    "test_known_issues"
    print title_case("2lmc Spool: 'Gruber on OmniFocus and Vapo(u)rware'")
    assert "2lmc Spool: 'Gruber on OmniFocus and Vapo(u)rware'" == title_case("2lmc Spool: 'Gruber on OmniFocus and Vapo(u)rware'")
  
    #test_url_after_colon
    assert "A Word: del.icio.us Site" == title_case("A Word: del.icio.us Site")
  
    #test_url_at_beginning
    assert "mucur.name Is a Treasure Trove" == title_case("mucur.name Is a Treasure Trove")
  
    #test_url_at_end
    assert "I Like google.com" == title_case("I Like google.com")
    print "Past all tests"

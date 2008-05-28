{-
Tests for title_case
-}
import Test.HUnit
import TitleCase

tester (a,b) = TestCase (assertEqual "" a b)
tests = TestList [
                TestLabel "test1" (tester ("Q&A With Steve Jobs: 'That's What Happens in Technology'",  title_case "Q&A With Steve Jobs: 'That's What Happens In Technology'")),
                TestLabel "test2" (tester ("What Is AT&T's Problem?" , title_case("What Is AT&T's Problem?"))),
                TestLabel "test3" (tester ("Apple Deal With AT&T Falls Through" , title_case("Apple Deal With AT&T Falls Through"))),
                TestLabel "test4" (tester ("This v That" , title_case("this v that"))),
                TestLabel "test5" (tester ("This vs That" , title_case("this vs that"))),
                TestLabel "test6" (tester ("This v. That" , title_case("this v. that"))),
                TestLabel "test7" (tester ("This vs. That" , title_case("this vs. that"))),
                TestLabel "test8" (tester ("The SEC's Apple Probe: What You Need to Know" , title_case("The SEC's Apple Probe: What You Need to Know"))),
                TestLabel "test9" (tester ("'By the Way, Small Word at the Start but Within Quotes.'" , title_case("'by the Way, small word at the start but within quotes.'"))),
                TestLabel "test10" (tester ("Small Word at End Is Nothing to Be Afraid Of" , title_case("Small word at end is nothing to be afraid of"))),
                TestLabel "test11" (tester ("Starting Sub-Phrase With a Small Word: A Trick, Perhaps?" , title_case("Starting Sub-Phrase With a Small Word: a Trick, Perhaps?"))),
                TestLabel "test12" (tester ("Sub-Phrase With a Small Word in Quotes: 'A Trick, Perhaps?'" , title_case("Sub-Phrase With a Small Word in Quotes: 'a Trick, Perhaps?'"))),
                TestLabel "test13" (tester ("Sub-Phrase With a Small Word in Quotes: \"A Trick, Perhaps?\"" , title_case("Sub-Phrase With a Small Word in Quotes: \"a Trick, Perhaps?\""))),
                TestLabel "test14" (tester ("\"Nothing to Be Afraid Of?\"" , title_case("\"Nothing to Be Afraid of?\""))),
                TestLabel "test15" (tester ("\"Nothing to Be Afraid Of?\"" , title_case("\"Nothing to Be Afraid Of?\""))),
                TestLabel "test16" (tester ("A Thing" , title_case("a thing"))),
                TestLabel "test17" (tester ("2lmc Spool: 'Gruber on OmniFocus and Vapo(u)rware'" , title_case("2lmc Spool: 'Gruber on OmniFocus and Vapo(u)rware'"))),
                TestLabel "test18" (tester ("A Word: del.icio.us Site" , title_case("A Word: del.icio.us Site"))),
                TestLabel "test19" (tester ("mucur.name Is a Treasure Trove" , title_case("mucur.name Is a Treasure Trove"))),
                TestLabel "test20" (tester ("I Like google.com",  title_case "I Like google.com" ))
        ]

main = do runTestTT tests
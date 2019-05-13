import Data.Either (isLeft)

import Test.HUnit

import Text.Parsec (parse, eof, ParseError)

import GoatLang.AST
import GoatLang.Parser
import GoatLang.PrettyPrint
import GoatLang.Token

-- A ParserUnitTest is a collection of test cases assocated with a single parser.
data ParserUnitTest node
  = ParserUnitTest (Parser node) [ParserTestCase node]

-- A ParserTestCase is an expected output corresponding to a list of inputs.
data ParserTestCase node
  = ParserTestCase (ParseResult node) [GoatInput]

-- A ParseResult corresponds to either a parsing error or an ASTNode.
data ParseResult node
  = ParseFailure
  | ParseSuccess node

type GoatInput = String

generateParserUnitTest :: (Eq node, Show node) => ParserUnitTest node -> Test
generateParserUnitTest (ParserUnitTest parser cases)
  = TestList (map (generateTestCase parser) cases)

generateTestCase :: (Eq node, Show node) => Parser node -> ParserTestCase node
  -> Test
generateTestCase parser (ParserTestCase result inputs)
  = TestList (map (generateAssertion parser result) inputs)

generateAssertion :: (Eq node, Show node) => Parser node -> ParseResult node
  -> GoatInput -> Test
generateAssertion parser result input
  = case result of
      ParseFailure -> TestCase $
        assertBool "" $ isLeft $ getParseResult parser input
      ParseSuccess node -> TestCase $ assertEqual "" (Right node) $
        getParseResult parser input

getParseResult :: Parser node -> GoatInput -> Either ParseError node
getParseResult parser input
  = parse (do {result <- parser; eof; return result}) "" input

--------------------------------------------------------------------------------

integerTest :: ParserUnitTest Int
integerTest
  = ParserUnitTest integer [
      ParserTestCase (ParseSuccess 42)
        ["42", "042", "0042", "00042"]
    , ParserTestCase ParseFailure
        ["", "4 2", "4,2", "0x42", "0xff", "4.2", "4."]
    ]

integerOrFloatTest :: ParserUnitTest (Either Int Float)
integerOrFloatTest
  = ParserUnitTest integerOrFloat [
      ParserTestCase ParseFailure
        [ "", "4 2", "4,2", "0x42", "0xff", ".0", "4.", "4.2.", "4.2.3"
        , "0.", "0. 0", "1e3", "1E3", "1E-3", "1E+4", "0x42"
        ]
    ]

main
  = runTestTT $ TestList [
      generateParserUnitTest integerTest
    , generateParserUnitTest integerOrFloatTest
    ]

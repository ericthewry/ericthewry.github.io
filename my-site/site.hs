--------------------------------------------------------------------------------
{-# LANGUAGE OverloadedStrings #-}
import           Data.Monoid (mappend)
import           Hakyll


--------------------------------------------------------------------------------
main :: IO ()
main = hakyll $ do
    match "images/*" $ do
        route   idRoute
        compile copyFileCompiler

    match "pdfs/*" $ do
        route   idRoute
        compile copyFileCompiler

    match "css/*" $ do
        route   idRoute
        compile compressCssCompiler

    match "papers/*" $ do
        route $ setExtension "html"
        compile $ pandocCompiler
            >>= loadAndApplyTemplate "templates/paper.html"    paperCtx
            >>= loadAndApplyTemplate "templates/default.html" paperCtx
            >>= relativizeUrls


    match "index.html" $ do
        route idRoute
        compile $ do
            papers <- recentFirst =<< loadAll "papers/*"
            let indexCtx =
                    listField "papers" paperCtx (return papers) `mappend`
                    constField "title" "Archives"               `mappend`
                    defaultContext

            getResourceBody
                >>= applyAsTemplate indexCtx
                >>= loadAndApplyTemplate "templates/default.html" indexCtx
                >>= relativizeUrls

    match "templates/*" $ compile templateBodyCompiler


--------------------------------------------------------------------------------
paperCtx :: Context String
paperCtx =
    dateField "date" "%B %e, %Y" `mappend`
    defaultContext
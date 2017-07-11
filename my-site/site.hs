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
            >>= loadAndApplyTemplate "templates/paper.html" paperCtx
            >>= loadAndApplyTemplate "templates/default.html" paperCtx
            >>= relativizeUrls

    match "teaching/*" $ do
      route $ setExtension "html"
      compile $ pandocCompiler
        >>= loadAndApplyTemplate "templates/teaching.html" defaultContext
        >>= loadAndApplyTemplate "templates/default.html" defaultContext
        >>= relativizeUrls

    match "news/*" $ do
      route $ setExtension "html"
      compile $ pandocCompiler
        >>= loadAndApplyTemplate "templates/news-item.html" paperCtx
        >>= loadAndApplyTemplate "templates/default.html" paperCtx
        >>= relativizeUrls

   
    create ["news.html"] $ do
      route idRoute
      compile $ do
        news <- reverse <$> (chronological =<< loadAll "news/*")
        let newsCtx =
              listField "news" paperCtx (return news) `mappend`
              constField "title" "News"               `mappend`
              defaultContext
        getResourceBody
          >>= applyAsTemplate newsCtx
          >>= loadAndApplyTemplate "templates/default.html" newsCtx
          >>= relativizeUrls

    create ["resume.tex"] $ do
      route idRoute
      compile $ do
        papers <- recentFirst =<< loadAll "papers/*"
        teaching <- reverse <$> (chronological =<< loadAll "teaching/*")
        let resumeCtx =
              listField "papers" paperCtx (return papers)           `mappend`
              listField "teaching" defaultContext (return teaching) `mappend`
              defaultContext

        getResourceBody
          >>= applyAsTemplate resumeCtx
          >>= loadAndApplyTemplate "templates/resume.tex" resumeCtx
          >>= relativizeUrls

    match "templates/*" $ compile templateBodyCompiler

    match "index.html" $ do
        route idRoute
        compile $ do
            papers <- recentFirst =<< loadAll "papers/*"
            teaching <- reverse <$> (chronological =<< loadAll "teaching/*")
            news <- (take 7). reverse <$> (chronological =<< loadAll "news/*")
            let indexCtx =
                    listField "papers" paperCtx (return papers)           `mappend`
                    listField "teaching" defaultContext (return teaching) `mappend`
                    listField "news" paperCtx (return news)               `mappend`
                    constField "title" "Home"                             `mappend`
                    defaultContext
                    
            getResourceBody
                >>= applyAsTemplate indexCtx
                >>= loadAndApplyTemplate "templates/default.html" indexCtx
                >>= relativizeUrls


--------------------------------------------------------------------------------
paperCtx :: Context String
paperCtx =
    dateField "date" "%B %e, %Y" `mappend`
    defaultContext

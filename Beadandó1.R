#1. Hozz létre egy fgv-t, amely ".csv", ".sav", ".json" vagy ".xlsx" [elsõ munkalap] 
#fájlneveket fogad el bemenetként (akár többet is), és azokat automatikusan beolvassa 
#és egy listába összefûzi, úgy hogy minden eleme egy data.frame formátum legyen


#minden fájltípusra tesztelve. A látható sablon alapján végtelen számú új bemenetet lehet hozzáadni. Az excel beolvasáshoz a readxl-t 
#package-t használtam

fgv = function(a,b) {
      if (grepl(".csv",a)) {
        df1 <- data.frame(read.csv(a)
                                      )
        }
      
      if (grepl(".sav",a)){
        df1 <- data.frame(read.spss(
                                    a,
                                    rownames= F,
                                    Stringsasfactors= T,
                                    tolower= F,
                                    reencode= T)
                                            )
        }

      if (grepl(".json",a)){
        df1 <- data.frame(fromJSON(file = a, simplify = T))
        }

      if (grepl(".xlsx",a)){
        df1 <- data.frame(read_xlsx(a, 
                                    sheet = 1, 
                                    col_names = TRUE,
                                    col_types = NULL, 
                                    na = "", 
                                    trim_ws = FALSE, 
                                    skip = 0,
                                    n_max= 10000,
                                    guess_max= min(1000, 10000),
                                    .name_repair = "unique")
          )
      }
  
    if (grepl(".csv",b)) {
      df2 <- data.frame(read.csv(b)
      )
  }
  
    if (grepl(".sav",b)){
      df2 <- data.frame(read.spss(
        b,
        rownames= F,
        Stringsasfactors= T,
        tolower= F,
        reencode= T)
      )
  }
  
    if (grepl(".json",b)){
      df2 <- data.frame(fromJSON(file = b, simplify = T))
  }
  
    if (grepl(".xlsx",b)){
      df2 <- data.frame(read_xlsx(b, 
                                  sheet = 1, 
                                  col_names = TRUE,
                                  col_types = NULL, 
                                  na = "", 
                                  trim_ws = FALSE, 
                                  skip = 0,
                                  n_max= 10000,
                                  guess_max= min(1000, 10000),
                                  .name_repair = "unique")
      )
  }
  
    lista <<- list(df1,df2)
}
      
                              
                
fgv("akármi.xlsx","ESS6_2.sav") 
 
install.packages("readxl")




  


  

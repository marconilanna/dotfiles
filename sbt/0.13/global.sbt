// ~/.sbt/global.sbt

// Uncomment to enable offline behavior for all projects
// offline := true

// Enable colors in Scala console (2.11.4)
initialize ~= { _ =>
  val ansi = System.getProperty("sbt.log.noformat", "false") != "true"
  if (ansi) System.setProperty("scala.color", "true")
}

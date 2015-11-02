// ~/.sbt/0.13/plugins/plugins.sbt

// Adds a `dependencyUpdates` task to check Maven repositories for dependency updates
// http://github.com/rtimush/sbt-updates
addSbtPlugin("com.timushev.sbt" % "sbt-updates" % "0.1.10")

// http://github.com/jrudolph/sbt-dependency-graph
addSbtPlugin("net.virtual-void" % "sbt-dependency-graph" % "0.7.5")

// http://github.com/orrsella/sbt-stats
addSbtPlugin("com.orrsella" % "sbt-stats" % "1.0.5")

// Creates Eclipse project definitions (.classpath, .project, .settings/)
// http://github.com/typesafehub/sbteclipse
//addSbtPlugin("com.typesafe.sbteclipse" % "sbteclipse-plugin" % "4.0.0")

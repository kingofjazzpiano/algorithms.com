workspace "Name" "Description" {

    !identifiers hierarchical

    model {
        contributor = person "Contributor" "The guy who helps the project develop"
        student = person "Student" "The man who wants to eat dog on algorithms"
        site = softwareSystem "Site algorithms.com" {
            site = container "Site algorithms.com"
            db = container "Database Schema" {
                tags "Database"
            }
        }
        contributor -> site.site "Improves site algorithms.com"
        student -> site.site "Grinding Computer Science"
        site.site -> site.db "Reads from and writes to"
    }

    views {
        systemContext site "SoftwareSystem" {
            include *
            autolayout lr
        }

        container site "Containers" {
            include *
            autolayout lr
        }

        styles {
            element "Person" {
                shape person
            }
            element "Database" {
                shape cylinder
            }
        }
    }

    configuration {
        scope softwaresystem
    }

}

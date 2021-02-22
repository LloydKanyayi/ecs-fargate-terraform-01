
data "template_file" "myecr" {
  template = file("./templates/ecr/ecrlfpolicy.json.tpl")
}

resource "aws_ecr_lifecycle_policy" "repo-policy" {
  repository = aws_ecr_repository.repo.name

  policy = data.template_file.myecr.rendered

}
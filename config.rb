wiki = Gollum::Wiki.new(".")

# on commit, pull latest from repo and push changes to repo
Gollum::Hook.register(:post_commit, :hook_id) do |committer, sha1|
  wiki.repo.git.pull("origin", "master")
  wiki.repo.git.push("origin", "master")
end
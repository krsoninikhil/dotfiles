;; go - go-mode
(exec-path-from-shell-copy-env "GOPATH")
(setq gofmt-command "goimports")
(add-hook 'before-save-hook 'gofmt-before-save)
(let ((govet (flycheck-checker-get 'go-vet 'command)))  ;; patch to use `go vet` instead of `go tool vet`, should be fixed in new version of flycheck
  (when (equal (cadr govet) "tool")
    (setf (cdr govet) (cddr govet))))

(provide 'lang-specific)

;;; essd-omg.el --- Omega customization

;; Copyright (C) 1999 A. J. Rossini

;; Author: A.J. Rossini <rossini@biostat.washington.edu>
;; Maintainer: A.J. Rossini <rossini@biostat.washington.edu>
;; Created: 15 August 1999
;; Modified: $Date: 1999/09/01 02:41:46 $
;; Version: $Revision: 5.1 $
;; RCS: $Id: essd-omg.el,v 5.1 1999/09/01 02:41:46 ess Exp $
;;
;; Keywords: start up, configuration.

;; This file is part of ESS.

;; This file is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 2, or (at your option)
;; any later version.

;; This file is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to
;; the Free Software Foundation, 675 Mass Ave, Cambridge, MA 02139, USA.

;;; Commentary:
;;; This file defines all the S-PLUS 3.x customizations for ess-mode.

;;; Requires and Autoloads:

(require 'essl-omg)

(autoload 'inferior-ess "ess-inf" "Run an ESS process")
(autoload 'ess-mode     "ess-mode" "Edit an ESS process")

; Code:

(defvar OMG-dialect-name "OMG"
  "Name of 'dialect' for Omega.");easily changeable in a user's .emacs

(defvar OMG-customize-alist
  '((ess-local-customize-alist     . 'OMG-customize-alist)
    (ess-language                  . "Omega")
    (ess-dialect                   . S+3-dialect-name)
    (ess-suffix                    . "omg")
    (ess-loop-timeout              . 500)
    (ess-dump-filename-template    . (concat (user-login-name)
					     ".%s."
					     ess-suffix))
    (ess-mode-editing-alist        . S-editing-alist)
    (ess-mode-syntax-table         . S-syntax-table)
    (ess-help-sec-regex            . ess-help-S+-sec-regex)
    (ess-help-sec-keys-alist       . S+-help-sec-keys-alist)
    (ess-object-name-db-file       . "ess-omg-namedb.el" )
    (ess-retr-lastvalue-command
     . ".Last.value = get(\".ess.lvsave\",frame=0)\n")
    (ess-save-lastvalue-command
     . "assign(\".ess.lvsave\",.Last.value,frame=0)\n")
    (inferior-ess-program          . inferior-S+3-program-name)
    (inferior-ess-objects-command  . "objects(%d)\n")
    (inferior-ess-help-command     . "help(\"%s\",pager=\"cat\",window=F)\n")
    (inferior-ess-exit-command     . "q()\n")
    (inferior-ess-primary-prompt   . "[a-zA-Z0-9() ]*> ?")
    (inferior-ess-secondary-prompt . "+ ?")
    (inferior-ess-start-file       . nil) ;"~/.ess-S+3")
    (inferior-ess-start-args       . ""))
 "Variables to customize for S+3")


(defun OMG (&optional proc-name)
  "Call Omega, from the Omega Group."
  (interactive)
  (setq ess-customize-alist S+3-customize-alist)
  (ess-write-to-dribble-buffer
   (format "\n(S+3): ess-dialect=%s, buf=%s\n" ess-dialect (current-buffer)))
  (inferior-ess))

(defun OMG-mode (&optional proc-name)
  "Major mode for editing Omega source.  See ess-mode for more help."
  (interactive)
  (setq ess-customize-alist S+3-customize-alist)
  (ess-mode S+3-customize-alist proc-name)
  (java-mode)
  (setq major-mode 'OMG-mode))

(defun OMG-transcript-mode ()
  "Omega transcript mode."
  (interactive)
  (ess-transcript-mode S+3-customize-alist))



 ; Provide package

(provide 'essd-sp3)

 ; Local variables section

;;; This file is automatically placed in Outline minor mode.
;;; The file is structured as follows:
;;; Chapters:     ^L ;
;;; Sections:    ;;*;;
;;; Subsections: ;;;*;;;
;;; Components:  defuns, defvars, defconsts
;;;              Random code beginning with a ;;;;* comment

;;; Local variables:
;;; mode: emacs-lisp
;;; outline-minor-mode: nil
;;; mode: outline-minor
;;; outline-regexp: "\^L\\|\\`;\\|;;\\*\\|;;;\\*\\|(def[cvu]\\|(setq\\|;;;;\\*"
;;; End:

;;; essd-sp3.el ends here
